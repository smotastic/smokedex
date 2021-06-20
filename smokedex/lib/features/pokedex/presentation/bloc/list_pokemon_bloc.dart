import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/core/domain/usecase.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/domain/usecases/list_pokemon_usecase.dart';

part 'list_pokemon_event.dart';

part 'list_pokemon_state.dart';

@injectable
class ListPokemonBloc extends Bloc<ListPokemonEvent, ListPokemonState> {
  final ListPokemonUsecase listPokemonUseCase;

  ListPokemonBloc(this.listPokemonUseCase) : super(ListPokemonLoadingState());

  @override
  Stream<ListPokemonState> mapEventToState(ListPokemonEvent event) async* {
    yield ListPokemonLoadingState();
    if (event is ListPokemonRequestedEvent) {
      final result = await listPokemonUseCase(ListPokemonParams(0, 0));
      yield result.fold((l) => ListPokemonLoadErrorState(l),
          (r) => ListPokemonLoadedState(r));
    }
  }
}
