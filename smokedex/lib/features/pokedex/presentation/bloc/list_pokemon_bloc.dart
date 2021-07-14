import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
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
    if (event is ListPokemonRequestedEvent) {
      final result = await listPokemonUseCase(
          ListPokemonParams(event.pageSize, event.offset));

      yield result.fold((l) => ListPokemonLoadErrorState(l),
          (r) => ListPokemonLoadedState(r));
    }
    if (event is ListPokemonNextPageRequestedEvent) {
      if (state is ListPokemonLoadedState) {
        final curPokemons = (state as ListPokemonLoadedState).pokemons;
        final result =
            await listPokemonUseCase(ListPokemonParams(25, curPokemons.length));
        yield result.fold((l) => ListPokemonLoadErrorState(l), (r) {
          return ListPokemonLoadedState([...curPokemons, ...r]);
        });
      }
    }
  }
}
