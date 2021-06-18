part of 'list_pokemon_bloc.dart';

abstract class ListPokemonState extends Equatable {}

class ListPokemonLoadingState extends ListPokemonState {
  @override
  List<Object?> get props => [];
}

class ListPokemonLoadedState extends ListPokemonState {
  final List<PokemonEntry> pokemons;

  ListPokemonLoadedState(this.pokemons);

  @override
  List<Object?> get props => [];
}

class ListPokemonLoadErrorState extends ListPokemonState {
  final Failure failure;

  ListPokemonLoadErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}
