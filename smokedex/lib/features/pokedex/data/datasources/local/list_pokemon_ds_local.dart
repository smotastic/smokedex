import 'package:dartz/dartz.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/core/domain/failure.dart';

abstract class ListPokemonDataSourceLocal {
  Future<Either<Failure, List<PokemonModel>>> list(num pageSize, num offset);

  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon);
}
