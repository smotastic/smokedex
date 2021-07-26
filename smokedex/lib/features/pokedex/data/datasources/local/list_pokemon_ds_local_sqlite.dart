import 'package:injectable/injectable.dart';

import 'package:smokedex/core/data/datasources/local/sqflite/sqflite_helper.dart';
import 'package:smokedex/core/data/meta/pokemon_meta.dart';
import 'package:smokedex/core/domain/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/service_locator.dart';
import 'package:sqflite/sqflite.dart';

import 'list_pokemon_ds_local.dart';

// @mobile
// @LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalSqlite extends ListPokemonDataSourceLocal {
  late final Future<Database> _database;

  ListPokemonDataSourceLocalSqlite() {
    _database = SqfliteHelper.I.database;
  }

  @override
  Future<Either<Failure, List<PokemonModel>>> list(
      num pageSize, num offset) async {
    final db = await _database;
    final pokeResult = await db.query(PokemonSqlMeta.table,
        limit: pageSize.toInt(),
        offset: offset.toInt(),
        orderBy: PokemonSqlMeta.id);

    var result = <PokemonModel>[];

    for (var poke in pokeResult) {
      final types = await db.query(PokemonTypeSqlMeta.table,
          where: '${PokemonTypeSqlMeta.pokemonId} = ?',
          whereArgs: [poke[PokemonSqlMeta.id]]);
      // result.add(PokemonModel(
      //   poke[PokemonSqlMeta.id] as int,
      //   poke[PokemonSqlMeta.name] as String,
      //   poke[PokemonSqlMeta.image] as String,
      //   types.map((e) => e[PokemonTypeSqlMeta.type] as String).toList(),
      // ));
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon) async {
    final db = await _database;
    await db.insert(
        PokemonSqlMeta.table,
        {
          PokemonSqlMeta.id: pokemon.id,
          PokemonSqlMeta.name: pokemon.name,
          PokemonSqlMeta.image: pokemon.imageUrl
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    for (var type in pokemon.types) {
      await db.insert(PokemonTypeSqlMeta.table, {
        PokemonTypeSqlMeta.type: type,
        PokemonTypeSqlMeta.pokemonId: pokemon.id
      });
    }
    return Right({});
  }
}
