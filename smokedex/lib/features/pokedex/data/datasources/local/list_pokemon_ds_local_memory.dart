import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/local/memory/memory_helper.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/service_locator.dart';

// @web
// @LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalMemory extends ListPokemonDataSourceLocal {
  @override
  Future<Either<Failure, List<PokemonModel>>> list(
      num pageSize, num offset) async {
    final db = await MemoryHelper.I.database;
    var result = <PokemonModel>[];
    numberGenerator
        .skip(offset.toInt())
        .take(pageSize.toInt())
        .forEach((element) {
      if (db.containsKey(element)) {
        final poke = db[element]!;
        result.add(PokemonModel(
            poke['id'],
            poke['name'],
            poke['weight'],
            poke['baseExperience'],
            poke['imageUrl'],
            poke['types'],
            poke['abilities']));
      }
    });

    return Right(result);
  }

  Iterable<int> get numberGenerator sync* {
    int i = 0;
    while (true) yield i++;
  }

  @override
  Future<Either<Failure, Map<num, PokemonModel>>> cache(
      num index, PokemonModel pokemon) async {
    final db = await MemoryHelper.I.database;
    db.putIfAbsent(
        index,
        () => {
              'id': pokemon.id,
              'name': pokemon.name,
              'imageUrl': pokemon.imageUrl,
              'weight': pokemon.weight,
              'baseExperience': pokemon.baseExperience,
              'types': pokemon.types,
              'abilities': pokemon.abilities
            });
    return Right({index: pokemon});
  }
}
