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
  PokemonEntry fromModel(PokeModel model) {
    final pokemonentry = PokemonEntry(model.name, model.id, model.imageUrl,
        model.types.map((e) => e).toList());
    return pokemonentry;
  }
}
