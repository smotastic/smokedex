import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

@LazySingleton(as: CachePokemonDataSourceRemote)
class CachePokemonDataSourceRemoteSupabase
    extends CachePokemonDataSourceRemote {
  @override
  Future<Either<Failure, bool>> cache(PokemonModel model) {
    // TODO implement
    return Future.value(Right(true));
  }
}
