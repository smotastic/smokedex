import 'package:injectable/injectable.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/usecase.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/domain/ports/list_pokemon_port.dart';

abstract class ListPokemonUsecase
    extends UseCase<List<PokemonEntry>, NoParams> {}

@LazySingleton(as: ListPokemonUsecase)
class ListPokemonUseCaseImpl extends ListPokemonUsecase {
  // final ListPokemonPort _port;

  ListPokemonUseCaseImpl();
  @override
  Future<Either<Failure, List<PokemonEntry>>> execute(NoParams params) async {
    var result = PokeApi().pokemon().page(0, 0);
    return Right([
      PokemonEntry('Bisasam'),
      PokemonEntry('Glumanda'),
      PokemonEntry('Schiggy')
    ]);
  }
}
