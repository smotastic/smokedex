import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/local/floor/database/floor_database.dart';
import 'package:smokedex/core/data/datasources/local/floor/floor_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_floor_mapper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

import 'package:smokedex/core/domain/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:smokedex/service_locator.dart';

import 'list_pokemon_ds_local.dart';

@floor
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalFloor extends ListPokemonDataSourceLocal {
  final FloorHelper helper;
  late final Future<AppDatabase> _database;

  ListPokemonDataSourceLocalFloor(this.helper) {
    _database = helper.database;
  }

  @override
  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon) async {
    final db = await _database;
    await db.pokemonDao
        .insertPokemon(PokemonFloorMapper.instance.fromPokemonModel(pokemon));
    return Right({index: pokemon});
  }

  @override
  Future<Either<Failure, List<PokemonModel>>> list(
      num pageSize, num offset) async {
    final db = await _database;
    final result =
        await db.pokemonDao.findPokemonPage(pageSize.toInt(), offset.toInt());
    final modelResult = result
        .map((e) => PokemonFloorMapper.instance.fromPokemonFloor(e))
        .toList();

    return Right(modelResult);
  }
}
