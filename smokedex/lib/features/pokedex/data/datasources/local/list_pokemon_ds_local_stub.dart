import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokeapi/src/models/pokemodel.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/service_locator.dart';

@web
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalStub extends ListPokemonDataSourceLocal {
  final db = <num, PokemonModel>{};

  @override
  Future<Either<Failure, List<PokemonModel>>> list(
      num pageSize, num offset) async {
    var result = <PokemonModel>[];
    numberGenerator
        .skip(offset.toInt())
        .take(pageSize.toInt())
        .forEach((element) {
      if (db.containsKey(element)) {
        result.add(db[element]!);
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
    db.putIfAbsent(index, () => pokemon);
    return Right({...db});
  }
}
