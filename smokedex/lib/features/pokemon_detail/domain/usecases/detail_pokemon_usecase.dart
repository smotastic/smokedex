import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/core/domain/usecase.dart';
import 'package:smokedex/features/pokemon_detail/domain/entities/pokemon_detail.dart';
import 'package:smokedex/features/pokemon_detail/domain/ports/detail_pokemon_port.dart';

class DetailPokemonParams extends Params {
  final num id;

  DetailPokemonParams(this.id);

  @override
  List<Object?> get props => [id];
}

abstract class DetailPokemonUsecase
    extends UseCase<PokemonDetail, DetailPokemonParams> {}

@LazySingleton(as: DetailPokemonUsecase)
class DetailPokemonUseCaseImpl extends DetailPokemonUsecase {
  final DetailPokemonPort _port;

  DetailPokemonUseCaseImpl(this._port);
  @override
  Future<Either<Failure, PokemonDetail>> execute(
      DetailPokemonParams params) async {
    return this._port.loadById(params.id);
  }
}
