import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/usecase.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

abstract class ListPokemonUsecase
    extends UseCase<List<PokemonEntry>, NoParams> {}

@LazySingleton(as: ListPokemonUsecase)
class ListPokemonUseCaseImpl extends ListPokemonUsecase {
  @override
  Future<Either<Failure, List<PokemonEntry>>> execute(NoParams params) async {
    return Right([
      PokemonEntry('Bisasam'),
      PokemonEntry('Glumanda'),
      PokemonEntry('Schiggy')
    ]);
  }
}
