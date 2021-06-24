import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/usecase.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/domain/ports/list_pokemon_port.dart';

class ListPokemonParams extends Params {
  final num pageSize;
  final num offset;

  ListPokemonParams(this.pageSize, this.offset);

  @override
  List<Object?> get props => [pageSize, offset];
}

abstract class ListPokemonUsecase
    extends UseCase<List<PokemonEntry>, ListPokemonParams> {}

@LazySingleton(as: ListPokemonUsecase)
class ListPokemonUseCaseImpl extends ListPokemonUsecase {
  final ListPokemonPort _port;

  ListPokemonUseCaseImpl(this._port);
  @override
  Future<Either<Failure, List<PokemonEntry>>> execute(
      ListPokemonParams params) async {
    return this._port.list(params.pageSize, params.offset);
  }
}
