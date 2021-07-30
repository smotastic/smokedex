import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:smokedex/core/data/datasources/local/moor/moor_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_data_mapper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

import 'package:smokedex/core/domain/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:smokedex/service_locator.dart';

import 'list_pokemon_ds_local.dart';

@moor
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalMoor extends ListPokemonDataSourceLocal {
  late final Future<Database> _database;

  ListPokemonDataSourceLocalMoor() {
    _database = MoorHelper.I.database;
  }
  @override
  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon) async {
    final db = await _database;

    await db.into(db.pokemon).insert(
        PokemonDataMapper.instance.fromModel(pokemon),
        mode: InsertMode.insertOrReplace);
    for (var type in pokemon.types) {
      await db.into(db.pokemonType).insert(
          PokemonTypeDataMapper.instance.fromModel(type, pokemon.id.toInt()));
    }
    for (var ability in pokemon.abilities) {
      await db.into(db.pokemonAbility).insert(PokemonAbilityDataMapper.instance
          .fromModel(ability, pokemon.id.toInt()));
    }

    for (var item in pokemon.heldItems) {
      final id = await db.into(db.item).insert(
          ItemDataMapper.instance.fromModel(item),
          mode: InsertMode.insertOrReplace);
      await db.into(db.pokemonItem).insert(
            PokemonItemDataMapper.instance.forMapping(pokemon.id.toInt(), id),
          );
    }

    for (var stat in pokemon.stats) {
      final id = await db.into(db.stat).insert(
          StatDataMapper.instance.fromModel(stat),
          mode: InsertMode.insertOrReplace);
      await db.into(db.pokemonStat).insert(
            PokemonStatDataMapper.instance
                .fromModel(stat, pokemon.id.toInt(), id),
          );
    }

    return Right({index: pokemon});
  }

  @override
  Future<Either<Failure, List<PokemonModel>>> list(
      num pageSize, num offset) async {
    final db = await _database;
    final select = db.select(db.pokemon)
      ..limit(pageSize.toInt(), offset: offset.toInt());
    var ret = <PokemonModel>[];

    final result = await select.get();
    for (var pokeData in result) {
      // POKEMON TYPES
      final typeSelect = db.select((db.pokemonType))
        ..where((tbl) => tbl.pokemonId.equals(pokeData.id));
      final types = await typeSelect.get();

      // POKEMON ABILITES
      final abilitySelect = db.select((db.pokemonAbility))
        ..where((tbl) => tbl.pokemonId.equals(pokeData.id));
      final abilities = await abilitySelect.get();

      // POKEMON STATS
      final statSelect = db.select(db.pokemonStat).join(
          [leftOuterJoin(db.stat, db.stat.id.equalsExp(db.pokemonStat.statId))])
        ..where(db.pokemonStat.pokemonId.equals(pokeData.id));
      final stats = await statSelect.get();
      final joinedStats = stats
          .map((e) => JoinedPokemonStat(
              e.readTable(db.pokemonStat), e.readTable(db.stat)))
          .toList();

      // POKEMON ITEMS
      final itemSelect = db.select(db.pokemonItem).join(
          [leftOuterJoin(db.item, db.item.id.equalsExp(db.pokemonItem.itemId))])
        ..where(db.pokemonItem.pokemonId.equals(pokeData.id));
      final items = await itemSelect.get();
      final itemsData = items.map((e) => e.readTable(db.item)).toList();

      ret.add(PokemonDataMapper.instance
          .fromData(pokeData, types, abilities, joinedStats, itemsData));
    }
    return Right(ret);
  }
}
