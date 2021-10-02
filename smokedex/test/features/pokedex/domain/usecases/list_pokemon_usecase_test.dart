import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smartdata/smartdata.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/domain/ports/list_pokemon_port.dart';
import 'package:smokedex/features/pokedex/domain/usecases/list_pokemon_usecase.dart';

import '../../data/model/pokedex_generator.dart';

/// Test for [ListPokemonUsecase]

class ListPokemonPortMock extends Mock implements ListPokemonPort {}

void main() {
  ListPokemonPort port = ListPokemonPortMock();

  ListPokemonUsecase sut = ListPokemonUseCaseImpl(port);

  setUp(() {
    init();
    registerFallbackValue(Smartdata.I.getSingle<PokemonModel>());
  });

  test('should call port', () async {
    // given
    final shouldPokemon = Smartdata.I.get<PokemonEntry>(1);
    when(() => port.list(any<num>(), any<num>()))
        .thenAnswer((_) => Future.value(Right(shouldPokemon)));
    num shouldPageSize = 10;
    final shouldOffset = 0;

    // when
    sut.execute(ListPokemonParams(shouldPageSize, shouldOffset));

    // then
    verify(() => port.list(shouldPageSize, shouldOffset)).called(1);
  });
}
