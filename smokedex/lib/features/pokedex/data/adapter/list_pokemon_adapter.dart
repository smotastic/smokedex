import 'dart:math';

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
  Future<Either<Failure, List<PokemonEntry>>> list(
      num pageSize, num offset) async {
    // final result = await PokeApi().pokemon().get(Random().nextInt(250));
    final result = await PokeApi().pokemon().page(20, 0);
    // TODO PaginationEntry Mapper
    return result.fold((l) => Left(UnknownFailure()), (r) {
      return Right(
          r.results.map((result) => PokemonEntry(result.name)).toList());
    });
  }
}
