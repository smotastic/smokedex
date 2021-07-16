import 'dart:async';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_mapper.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/domain/ports/list_pokemon_port.dart';

@LazySingleton(as: ListPokemonPort)
class ListPokemonAdapter extends ListPokemonPort {
  ListPokemonDataSourceLocal dataSourceLocal;
  ListPokemonDataSourceRemote dataSourceRemote;

  ListPokemonAdapter(this.dataSourceLocal, this.dataSourceRemote);

  @override
  Future<Either<Failure, List<PokemonEntry>>> list(
      num pageSize, num offset) async {
    // first check locally
    final localResult = await dataSourceLocal.list(pageSize, offset);

    List<PokemonModel> pokemon;
    if (localResult.isRight()) {
      final localPokemon = localResult.getOrElse(() => throw UnknownFailure());
      if (localPokemon.length == pageSize) {
        pokemon = localPokemon;
        return Right(pokemon.map((model) => fromModel(model)).toList());
      }
    }

    final result = await dataSourceRemote.list(pageSize, offset);
    // TODO PaginationEntry Mapper
    return result.fold((l) => Left(UnknownFailure()), (r) {
      var entries = <PokemonEntry>[];
      r.forEach((model) {
        dataSourceLocal.cache(model.id - 1, model);
        entries.add(fromModel(model));
      });
      return Right(entries);
    });
  }

  PokemonEntry fromModel(PokemonModel model) {
    return PokemonEntry(
      model.name,
      model.id,
      model.sprites.other?.officialArtwork?.frontDefault ??
          model.sprites.frontDefault!,
      model.types.map((e) => e.type.name).toList(),
    );
  }
}
