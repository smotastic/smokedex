import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model_mapper.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/domain/ports/list_pokemon_port.dart';

@LazySingleton(as: ListPokemonPort)
class ListPokemonAdapter extends ListPokemonPort {
  ListPokemonDataSourceLocal dataSourceLocal;
  ListPokemonDataSourceRemote dataSourceRemote;
  CachePokemonDataSourceRemote cacheDataSourceRemote;

  ListPokemonAdapter(
      this.dataSourceLocal, this.dataSourceRemote, this.cacheDataSourceRemote);

  @override
  Future<Either<Failure, List<PokemonEntry>>> list(
      num pageSize, num offset) async {
    // first check locally
    final localResult = await dataSourceLocal.list(pageSize, offset);

    List<PokemonModel> pokemon;
    if (localResult.isRight()) {
      final localPokemon = localResult.getOrElse(() => throw UnknownFailure());
      // very simple check, could also check all matching id's of local pokemon and only request missing ones
      if (localPokemon.length == pageSize) {
        pokemon = localPokemon;
        return Right(pokemon
            .map((model) => PokemonEntryMapper.instance.fromModel(model))
            .toList());
      }
    }

    final result = await dataSourceRemote.list(pageSize, offset);
    return result.fold(
      (l) => Left(UnknownFailure()),
      (r) {
        var entries = <PokemonEntry>[];
        r.forEach((model) {
          dataSourceLocal.cache(model.id - 1, model);
          cacheDataSourceRemote.cache(model);
          entries.add(PokemonEntryMapper.instance.fromModel(model));
        });
        return Right(entries);
      },
    );
  }
}
