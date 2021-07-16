import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/data/models/poke_model.dart';

abstract class ListPokemonDataSourceLocal {
  Future<Either<Failure, List<PokeModel>>> list(num pageSize, num offset);

  Future<Either<Failure, Map<num, PokeModel>>> cache(
      num index, PokeModel pokemon);
}
