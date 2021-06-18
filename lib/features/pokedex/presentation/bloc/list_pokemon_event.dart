part of 'list_pokemon_bloc.dart';

abstract class ListPokemonEvent extends Equatable {}

class ListPokemonRequestedEvent extends ListPokemonEvent {
  @override
  List<Object?> get props => [];
}
