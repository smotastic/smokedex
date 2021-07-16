import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';

import 'package:smokeapi/src/models/pokemodel.dart';

import 'package:dartz/dartz.dart';
import 'package:smokedex/service_locator.dart';

import 'list_pokemon_ds_local.dart';

@mobile
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalSqlite extends ListPokemonDataSourceLocal {
  @override
  Future<Either<Failure, List<PokemonModel>>> list(num pageSize, num offset) {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon) {
    // TODO: implement cache
    throw UnimplementedError();
  }
}
