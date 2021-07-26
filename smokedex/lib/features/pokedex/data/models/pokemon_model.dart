class PokemonModel {
  final num id;
  final String name;
  final String imageUrl;
  final int weight;
  final int baseExperience;
  final List<String> types;
  final List<PokemonAbilityModel> abilities;

  PokemonModel(this.id, this.name, this.imageUrl, this.weight,
      this.baseExperience, this.types, this.abilities);
}

class PokemonAbilityModel {
  final String name;
  final String effect;
  final String shortEffect;
  final String language;

  PokemonAbilityModel(this.name, this.effect, this.shortEffect, this.language);
}
