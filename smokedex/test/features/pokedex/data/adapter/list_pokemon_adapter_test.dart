import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smartdata/smartdata.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/data/adapter/list_pokemon_adapter.dart';
import 'package:smokedex/features/pokedex/data/datasources/local/list_pokemon_ds_local.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/ports/list_pokemon_port.dart';

import '../model/pokedex_generator.dart';

/// Test for [ListPokemonAdapter]

class ListPokemonDataSourceLocalMock extends Mock
    implements ListPokemonDataSourceLocal {}

class ListPokemonDataSourceRemoteMock extends Mock
    implements ListPokemonDataSourceRemote {}

class CachePokemonDataSourceRemoteMock extends Mock
    implements CachePokemonDataSourceRemote {}

void main() {
  ListPokemonDataSourceLocal dataSourceLocal = ListPokemonDataSourceLocalMock();
  ListPokemonDataSourceRemote dataSourceRemote =
      ListPokemonDataSourceRemoteMock();
  CachePokemonDataSourceRemote cacheDataSourceRemote =
      CachePokemonDataSourceRemoteMock();

  ListPokemonPort sut = ListPokemonAdapter(
      dataSourceLocal, dataSourceRemote, cacheDataSourceRemote);

  setUp(() {
    init();
  });

  test('should use local cache when cache is filled', () async {
    // given
    final shouldReadAmount = 25;
    final pokemons = Smartdata.I.get<PokemonModel>(shouldReadAmount);
    Either<Failure, List<PokemonModel>> should = Right(pokemons);
    when(() => dataSourceLocal.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(should));
    // when
    final actual = await sut.list(shouldReadAmount, 0);

    expect(actual.isRight(), equals(true));
    final actualEntries = actual.getOrElse(() => throw 'Impossible');
    expect(actualEntries.length, equals(shouldReadAmount));
  });
}
