import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

abstract class ListPokemonDataSourceLocal {
  Future<Either<Failure, List<PokemonModel>>> list(num pageSize, num offset);

  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon);
}
