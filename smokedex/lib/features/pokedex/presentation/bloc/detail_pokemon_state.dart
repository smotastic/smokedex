part of 'detail_pokemon_bloc.dart';

abstract class DetailPokemonState extends Equatable {}

class DetailPokemonLoadingState extends DetailPokemonState {
  @override
  List<Object?> get props => [];
}

class DetailPokemonLoadedState extends DetailPokemonState {
  final PokemonEntry pokemon;

  DetailPokemonLoadedState(this.pokemon);

  @override
  List<Object?> get props => [pokemon];
}

class DetailPokemonLoadErrorState extends DetailPokemonState {
  final Failure failure;

  DetailPokemonLoadErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}
