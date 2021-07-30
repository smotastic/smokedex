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

class ItemDataMapperImpl extends ItemDataMapper {
  ItemDataMapperImpl() : super();

  @override
  PokemonHeldItemModel fromData(ItemData data) {
    final pokemonhelditemmodel = PokemonHeldItemModel(data.name);
    return pokemonhelditemmodel;
  }
}

class PokemonItemDataMapperImpl extends PokemonItemDataMapper {
  PokemonItemDataMapperImpl() : super();
}

class StatDataMapperImpl extends StatDataMapper {
  StatDataMapperImpl() : super();
}

class PokemonStatDataMapperImpl extends PokemonStatDataMapper {
  PokemonStatDataMapperImpl() : super();
}

class JoinedPokemonStatMapperImpl extends JoinedPokemonStatMapper {
  JoinedPokemonStatMapperImpl() : super();
}
