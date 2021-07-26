// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_data_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PokemonDataMapperImpl extends PokemonDataMapper {
  PokemonDataMapperImpl() : super();
}

class PokemonTypeDataMapperImpl extends PokemonTypeDataMapper {
  PokemonTypeDataMapperImpl() : super();
}

class PokemonAbilityDataMapperImpl extends PokemonAbilityDataMapper {
  PokemonAbilityDataMapperImpl() : super();

  @override
  PokemonAbilityModel fromData(PokemonAbilityData data) {
    final pokemonabilitymodel = PokemonAbilityModel(
        data.name, data.effect, data.shortEffect, data.language);
    return pokemonabilitymodel;
  }
}
