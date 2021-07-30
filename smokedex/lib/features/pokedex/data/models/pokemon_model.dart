class PokemonModel {
  final num id;
  final String name;
  final String imageUrl;
  final int weight;
  final int baseExperience;
  final List<String> types;
  final List<PokemonAbilityModel> abilities;
  final List<PokemonStatModel> stats;
  final List<PokemonHeldItemModel> heldItems;

  PokemonModel(
      this.id,
      this.name,
      this.imageUrl,
      this.weight,
      this.baseExperience,
      this.types,
      this.abilities,
      this.stats,
      this.heldItems);
}

class PokemonAbilityModel {
  final String name;
  final String effect;
  final String shortEffect;
  final String language;

  PokemonAbilityModel(this.name, this.effect, this.shortEffect, this.language);
}

class PokemonStatModel {
  final String name;
  final int effort;
  final int baseStat;

  PokemonStatModel(this.name, this.effort, this.baseStat);
}

class PokemonHeldItemModel {
  final String name;

  PokemonHeldItemModel(this.name);
}
