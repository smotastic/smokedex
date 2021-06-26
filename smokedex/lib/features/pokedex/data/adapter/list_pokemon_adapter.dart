import 'dart:async';
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
    final result = await PokeApi().pokemon().page(1, 0);
    // TODO PaginationEntry Mapper
    return result.fold(
        (l) => Left(UnknownFailure()),
        (r) async =>
            Right(await Future.wait(r.results.map(mapResultEntry).toList())));
  }

  Future<PokemonEntry> mapResultEntry(NamedResourceModel resultEntry) async {
    final result = await PokeApi().pokemon().get(resultEntry.id);
    // final pokemon = result.getOrElse(() => PokemonModel(
    //     -1, "Unknown", -1, PokemonSpriteModel('', '', '', '', '', '', '', )));
    final pokemon = result.getOrElse(() => throw UnknownFailure());

    return PokemonEntry(
      resultEntry.name,
      resultEntry.id,
      pokemon.sprites.other?.officialArtwork?.frontDefault ??
          pokemon.sprites.frontDefault!,
      pokemon.types.map((e) => e.type.name).toList(),
    );
  }
}
