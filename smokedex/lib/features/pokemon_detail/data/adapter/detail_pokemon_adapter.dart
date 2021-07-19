import 'package:injectable/injectable.dart';
import 'package:smokedex/features/pokemon_detail/domain/entities/pokemon_detail.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokemon_detail/domain/ports/detail_pokemon_port.dart';

@LazySingleton(as: DetailPokemonPort)
class DetailPokemonAdapter extends DetailPokemonPort {
  @override
  Future<Either<Failure, PokemonDetail>> loadById(num id) async {
    return Right(PokemonDetail(id,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png'));
  }
}
