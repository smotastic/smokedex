// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_hive_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PokemonHiveMapperImpl extends PokemonHiveMapper {
  PokemonHiveMapperImpl() : super();

  @override
  HivePokemon fromModel(PokemonModel model) {
    final hivepokemon = HivePokemon(
        model.id,
        model.name,
        model.imageUrl,
        model.weight,
        model.baseExperience,
        model.heldItems.map(fromItemModel).toList(),
        model.stats.map(fromStatModel).toList(),
        model.types.map((e) => e).toList(),
        model.abilities.map(fromAbilityModel).toList());
    return hivepokemon;
  }

  @override
  HivePokemonHeldItem fromItemModel(PokemonHeldItemModel model) {
    final hivepokemonhelditem = HivePokemonHeldItem(model.name);
    return hivepokemonhelditem;
  }

  @override
  HivePokemonStat fromStatModel(PokemonStatModel model) {
    final hivepokemonstat =
        HivePokemonStat(model.name, model.effort, model.baseStat);
    return hivepokemonstat;
  }

  @override
  HivePokemonAbility fromAbilityModel(PokemonAbilityModel model) {
    final hivepokemonability = HivePokemonAbility(
        model.name, model.effect, model.shortEffect, model.language);
    return hivepokemonability;
  }

  @override
  PokemonModel fromHive(HivePokemon pokemon) {
    final pokemonmodel = PokemonModel(
        pokemon.id,
        pokemon.name,
        pokemon.imageUrl,
        pokemon.weight,
        pokemon.baseExperience,
        pokemon.types.map((e) => e).toList(),
        pokemon.abilities.map(fromHiveAbility).toList(),
        pokemon.stats.map(fromHiveStat).toList(),
        pokemon.heldItems.map(fromHiveHeldItem).toList());
    return pokemonmodel;
  }

  @override
  PokemonHeldItemModel fromHiveHeldItem(HivePokemonHeldItem item) {
    final pokemonhelditemmodel = PokemonHeldItemModel(item.name);
    return pokemonhelditemmodel;
  }

  @override
  PokemonStatModel fromHiveStat(HivePokemonStat stat) {
    final pokemonstatmodel =
        PokemonStatModel(stat.name, stat.effort, stat.baseStat);
    return pokemonstatmodel;
  }

  @override
  PokemonAbilityModel fromHiveAbility(HivePokemonAbility ability) {
    final pokemonabilitymodel = PokemonAbilityModel(
        ability.name, ability.effect, ability.shortEffect, ability.language);
    return pokemonabilitymodel;
  }
}
