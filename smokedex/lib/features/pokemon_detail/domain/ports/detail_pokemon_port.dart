import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokemon_detail/domain/entities/pokemon_detail.dart';

abstract class DetailPokemonPort {
  Future<Either<Failure, PokemonDetail>> loadById(num id);
}
