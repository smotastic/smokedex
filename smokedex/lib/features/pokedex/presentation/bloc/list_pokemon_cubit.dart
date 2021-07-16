import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/domain/usecases/list_pokemon_usecase.dart';

part 'list_pokemon_state.dart';

@LazySingleton()
class ListPokemonCubit extends Cubit<ListPokemonState> {
  final ListPokemonUsecase listPokemonUseCase;

  ListPokemonCubit(this.listPokemonUseCase) : super(ListPokemonLoadingState());

  void initialLoad() async {
    final result = await listPokemonUseCase(ListPokemonParams(25, 0));

    result.fold((l) => emit(ListPokemonLoadErrorState(l)),
        (r) => emit(ListPokemonLoadedState(r)));
  }

  void requestNextPage() async {
    final _state = state;
    if (_state is ListPokemonLoadedState) {
      final curPokemons = _state.pokemons;
      final result =
          await listPokemonUseCase(ListPokemonParams(25, curPokemons.length));
      result.fold((l) => emit(ListPokemonLoadErrorState(l)), (r) {
        return emit(ListPokemonLoadedState([...curPokemons, ...r]));
      });
    }
  }
}
