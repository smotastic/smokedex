import 'package:smartstruct/smartstruct.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/core/data/datasources/local/moor/moor_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

part 'pokemon_mapper.mapper.g.dart';

@Mapper()
abstract class PokemonMapper {
  static PokemonMapper get instance => PokemonMapperImpl();

  PokemonModel fromResource(PokemonResource model,
      List<PokemonTypeResource> types, List<PokemonAbilityResource> abilities) {
    return PokemonModel(
        model.id,
        model.name,
        model.sprites.other?.officialArtwork?.frontDefault ??
            model.sprites.frontDefault!,
        model.weight,
        model.baseExperience,
        types.map((e) => e.name).toList(),
        abilities.map(fromAbilityResource).toList());
  }

  PokemonAbilityModel fromAbilityResource(PokemonAbilityResource resource) {
    final effect = resource.effectEntries.first;
    return PokemonAbilityModel(
        resource.name, effect.effect, effect.shortEffect, effect.language.name);
  }
}

@Mapper()
abstract class PokemonEntryMapper {
  static PokemonEntryMapper get instance => PokemonEntryMapperImpl();

  PokemonEntry fromModel(PokemonModel model);
}

@Mapper()
abstract class PokemonDataMapper {
  static PokemonDataMapper get instance => PokemonDataMapperImpl();

  PokemonModel fromData(PokemonData data, List<String> types,
      List<PokemonAbilityData> abilities) {
    return PokemonModel(
        data.id,
        data.name,
        data.image,
        data.weight,
        data.baseExperience,
        types,
        abilities.map(PokemonAbilityDataMapper.instance.fromData).toList());
  }

  PokemonData fromModel(PokemonModel model) {
    return PokemonData(
        id: model.id.toInt(),
        name: model.name,
        image: model.imageUrl,
        weight: model.weight,
        baseExperience: model.baseExperience);
  }
}

@Mapper()
abstract class PokemonAbilityDataMapper {
  static PokemonAbilityDataMapper get instance =>
      PokemonAbilityDataMapperImpl();

  PokemonAbilityModel fromData(PokemonAbilityData data);
}
