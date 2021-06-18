import 'package:injectable/injectable.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_mapper.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/domain/ports/list_pokemon_port.dart';

@LazySingleton(as: ListPokemonPort)
class ListPokemonAdapter extends ListPokemonPort {
  @override
  Future<Either<Failure, List<PokemonEntry>>> list() async {
    final result = await PokeApi().pokemon().page(0, 0);
    return result.fold(
        (l) => Left(UnknownFailure()),
        (r) => Right(r
            .map((model) => PokemonMapper.instance.fromModel(model))
            .toList()));
  }
}
