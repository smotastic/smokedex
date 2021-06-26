part of 'detail_pokemon_bloc.dart';

abstract class DetailPokemonEvent extends Equatable {}

class DetailPokemonRequestedEvent extends DetailPokemonEvent {
  final int id;

  DetailPokemonRequestedEvent(this.id);
  @override
  List<Object?> get props => [this.id];
}
