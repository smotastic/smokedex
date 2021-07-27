import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

abstract class CachePokemonDataSourceRemote {
  Future<Either<Failure, bool>> cache(PokemonModel model);
}
