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
    registerFallbackValue(Smartdata.I.getSingle<PokemonModel>());
  });

  test('should use local cache when cache is filled', () async {
    // given
    final shouldReadAmount = 25;
    final localPokemons = Smartdata.I.get<PokemonModel>(shouldReadAmount);
    final remotePokemons = <PokemonModel>[];
    Either<Failure, List<PokemonModel>> should = Right(localPokemons);
    when(() => dataSourceLocal.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(should));
    when(() => dataSourceRemote.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(Right(remotePokemons)));
    // when
    final actual = await sut.list(shouldReadAmount, 0);

    // then
    expect(actual.isRight(), equals(true));
    final actualEntries = actual.getOrElse(() => throw 'Impossible');
    expect(actualEntries.length, equals(shouldReadAmount));
  });

  test('should use remote when cache is partially empty', () async {
    // given
    final shouldReadAmount = 25;
    final localPokemons = Smartdata.I
        .get<PokemonModel>(2); // less than the requested ones in local cache
    final remotePokemons = Smartdata.I.get<PokemonModel>(shouldReadAmount);
    Either<Failure, List<PokemonModel>> should = Right(remotePokemons);
    when(() => dataSourceLocal.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(Right(localPokemons)));
    when(() => dataSourceRemote.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(should));

    when(() => dataSourceLocal.cache(any<num>(), any<PokemonModel>()))
        .thenAnswer((_) => Future.value(Left(UnknownFailure())));
    when(() => cacheDataSourceRemote.cache(any<PokemonModel>()))
        .thenAnswer((_) => Future.value(Right(true)));
    // when
    final actual = await sut.list(shouldReadAmount, 0);

    // then
    expect(actual.isRight(), equals(true));
    final actualEntries = actual.getOrElse(() => throw 'Impossible');
    expect(actualEntries.length, equals(shouldReadAmount));
    verify(() => dataSourceRemote.list(any<num>(), any<num>())).called(1);
    verify(() => dataSourceLocal.cache(any<num>(), any<PokemonModel>()))
        .called(shouldReadAmount);
    verify(() => cacheDataSourceRemote.cache(any<PokemonModel>()))
        .called(shouldReadAmount);
  });

  test('should use remote when local cache results in failure', () async {
    // given
    final shouldReadAmount = 10;
    final remotePokemons = Smartdata.I.get<PokemonModel>(shouldReadAmount);
    Either<Failure, List<PokemonModel>> should = Right(remotePokemons);

    when(() => dataSourceLocal.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(Left(UnknownFailure())));
    when(() => dataSourceRemote.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(should));

    when(() => dataSourceLocal.cache(any<num>(), any<PokemonModel>()))
        .thenAnswer((_) => Future.value(Left(UnknownFailure())));
    when(() => cacheDataSourceRemote.cache(any<PokemonModel>()))
        .thenAnswer((_) => Future.value(Right(true)));
    // when
    final actual = await sut.list(10, 0);
    // then
    expect(actual.isRight(), equals(true));
    final actualEntries = actual.getOrElse(() => throw 'Impossible');
    expect(actualEntries.length, equals(shouldReadAmount));
    verify(() => dataSourceRemote.list(any<num>(), any<num>())).called(1);
    verify(() => dataSourceLocal.cache(any<num>(), any<PokemonModel>()))
        .called(shouldReadAmount);
    verify(() => cacheDataSourceRemote.cache(any<PokemonModel>()))
        .called(shouldReadAmount);
  });

  test('should return failure when local and remote fails', () async {
    // given
    when(() => dataSourceLocal.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(Left(UnknownFailure())));
    when(() => dataSourceRemote.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(Left(UnknownFailure())));
    // when
    final actual = await sut.list(10, 0);

    // then
    expect(actual.isLeft(), equals(true));
  });
}
