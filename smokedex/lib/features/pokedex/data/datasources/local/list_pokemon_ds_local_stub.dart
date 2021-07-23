import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/local/memory_helper.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/features/pokedex/data/models/poke_model.dart';
import 'package:smokedex/service_locator.dart';

@web
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalStub extends ListPokemonDataSourceLocal {
  @override
  Future<Either<Failure, List<PokeModel>>> list(
      num pageSize, num offset) async {
    final db = await MemoryHelper.I.database;
    var result = <PokeModel>[];
    numberGenerator
        .skip(offset.toInt())
        .take(pageSize.toInt())
        .forEach((element) {
      if (db.containsKey(element)) {
        final poke = db[element]!;
        result.add(PokeModel(
            poke['id'], poke['name'], poke['imageUrl'], poke['types']));
      }
    });

    return Right(result);
  }

  Iterable<int> get numberGenerator sync* {
    int i = 0;
    while (true) yield i++;
  }

  @override
  Future<Either<Failure, Map<num, PokeModel>>> cache(
      num index, PokeModel pokemon) async {
    final db = await MemoryHelper.I.database;
    db.putIfAbsent(
        index,
        () => {
              'id': pokemon.id,
              'name': pokemon.name,
              'imageUrl': pokemon.imageUrl,
              'types': pokemon.types
            });
    return Right({index: pokemon});
  }
}
