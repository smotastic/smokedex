import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/local/hive/hive_helper.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_hive_mapper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/service_locator.dart';

@hive
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalHive extends ListPokemonDataSourceLocal {
  final HiveHelper helper;
  late final Future<HiveInterface> _db;

  ListPokemonDataSourceLocalHive(this.helper) {
    _db = helper.database;
  }

  @override
  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon) async {
    final db = await _db;
    final pokemonBox = await db.openBox('pokemon');
    final hivePoke = PokemonHiveMapper.instance.fromModel(pokemon);
    pokemonBox.put(index, hivePoke);
    return Right({index: pokemon});
  }

  Iterable<int> get numberGenerator sync* {
    int i = 0;
    while (true) yield i++;
  }

  @override
  Future<Either<Failure, List<PokemonModel>>> list(
      num pageSize, num offset) async {
    final db = await _db;
    final pokemonBox = await db.openBox('pokemon');
    final result = <PokemonModel>[];
    numberGenerator
        .skip(offset.toInt())
        .take(pageSize.toInt())
        .forEach((element) {
      HivePokemon? pokemon = pokemonBox.get(element);
      if (pokemon != null) {
        result.add(PokemonHiveMapper.instance.fromHive(pokemon));
      }
    });

    return Right(result);
  }
}
