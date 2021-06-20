import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

abstract class ListPokemonPort {
  Future<Either<Failure, List<PokemonEntry>>> list(num start, num offset);
}
