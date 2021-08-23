// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_floor_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PokemonFloorMapperImpl extends PokemonFloorMapper {
  PokemonFloorMapperImpl() : super();

  @override
  PokemonFloor fromPokemonModel(PokemonModel model) {
    final pokemonfloor = PokemonFloor(numToInt(model), model.name,
        model.imageUrl, model.weight, model.baseExperience);
    return pokemonfloor;
  }
}
