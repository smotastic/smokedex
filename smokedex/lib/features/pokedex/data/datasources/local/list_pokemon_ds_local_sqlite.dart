import 'package:dartz/dartz_unsafe.dart';
import 'package:injectable/injectable.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/core/data/datasources/local/sqflite_helper.dart';
import 'package:smokedex/core/data/meta/pokemon_meta.dart';
import 'package:smokedex/core/domain/failure.dart';

import 'package:smokeapi/src/models/pokemodel.dart';

import 'package:dartz/dartz.dart';
import 'package:smokedex/service_locator.dart';
import 'package:sqflite/sqflite.dart';

import 'list_pokemon_ds_local.dart';

@mobile
@LazySingleton(as: ListPokemonDataSourceLocal)
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
      // TODO nicht das PokemonModel aus API verwenden, sondern eigenes schreiben
      result.add(PokemonModel(
          poke[PokemonSqlMeta.id] as int,
          poke[PokemonSqlMeta.name] as String,
          0,
          types
              .map((e) => PokemonTypeModel(0,
                  NamedResourceModel(e[PokemonTypeSqlMeta.type] as String, 0)))
              .toList(),
          PokemonSpriteModel('', '', '', '',
              poke[PokemonSqlMeta.image] as String, '', '', null)));
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon) async {
    return Right({});
  }
}
