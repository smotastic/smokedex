part of 'list_pokemon_bloc.dart';

abstract class ListPokemonEvent extends Equatable {}

class ListPokemonRequestedEvent extends ListPokemonEvent {
  final int pageSize;
  final int offset;

  ListPokemonRequestedEvent(this.pageSize, this.offset);
  @override
  List<Object?> get props => [this.pageSize, this.offset];
}
