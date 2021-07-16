import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/features/pokedex/data/models/poke_model.dart';
import 'package:smokedex/service_locator.dart';

@web
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalStub extends ListPokemonDataSourceLocal {
  final db = <num, PokeModel>{};

  @override
  Future<Either<Failure, List<PokeModel>>> list(
      num pageSize, num offset) async {
    var result = <PokeModel>[];
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
  Future<Either<Failure, Map<num, PokeModel>>> cache(
      num index, PokeModel pokemon) async {
    db.putIfAbsent(index, () => pokemon);
    return Right({...db});
  }
}
