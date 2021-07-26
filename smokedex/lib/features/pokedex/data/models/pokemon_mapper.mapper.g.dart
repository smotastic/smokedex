// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PokemonMapperImpl extends PokemonMapper {
  PokemonMapperImpl() : super();
}

class PokemonEntryMapperImpl extends PokemonEntryMapper {
  PokemonEntryMapperImpl() : super();

  @override
  PokemonEntry fromModel(PokemonModel model) {
    final pokemonentry = PokemonEntry(model.name, model.id, model.imageUrl,
        model.types.map((e) => e).toList());
    return pokemonentry;
  }
}

class PokemonDataMapperImpl extends PokemonDataMapper {
  PokemonDataMapperImpl() : super();
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
