import 'package:smartstruct/smartstruct.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

part 'pokemon_model_mapper.mapper.g.dart';

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
