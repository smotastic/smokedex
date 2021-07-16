import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/data/models/poke_model.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_mapper.dart';

abstract class ListPokemonDataSourceRemote {
  Future<Either<Failure, List<PokeModel>>> list(num pageSize, num offset);
}

@LazySingleton(as: ListPokemonDataSourceRemote)
class ListPokemonDataSourceRemoteImpl extends ListPokemonDataSourceRemote {
  @override
  Future<Either<Failure, List<PokeModel>>> list(
      num pageSize, num offset) async {
    final result = await PokeApi().pokemon().page(pageSize, offset);
    return result.fold(
        (l) => Left(UnknownFailure()),
        (r) async =>
            Right(await Future.wait(r.results.map(_fromResultEntry).toList())));
  }

  Future<PokeModel> _fromResultEntry(NamedResourceModel resultEntry) async {
    final result = await PokeApi().pokemon().get(resultEntry.id);
    final pokemon = result.getOrElse(() => throw UnknownFailure());
    return PokemonMapper.instance.fromModel(pokemon);
  }
}
