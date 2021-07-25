import 'package:smokeapi/src/models/base_resource.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/named_resource.dart';
part 'pokemon_resource.g.dart';

@JsonSerializable()
class PokemonResource extends BaseResource {
  final int id;
  final String name;
  final int weight;
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  final List<PokemonTypeResource> types;
  final PokemonSpriteResource sprites;
  final List<PokemonAbilityResource> abilities;

  PokemonResource(this.id, this.name, this.weight, this.baseExperience,
      this.types, this.sprites, this.abilities);

  factory PokemonResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonResourceFromJson(json);
  }
}

@JsonSerializable()
class PokemonAbilityResource {
  final NamedResourceModel ability;
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  final int slot;

  PokemonAbilityResource(this.ability, this.isHidden, this.slot);

  factory PokemonAbilityResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonAbilityResourceFromJson(json);
  }
}

@JsonSerializable()
class PokemonTypeResource {
  final int slot;
  final NamedResourceModel type;

  PokemonTypeResource(this.slot, this.type);

  factory PokemonTypeResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonTypeResourceFromJson(json);
  }
}

@JsonSerializable()
class PokemonSpriteResource {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
  @JsonKey(name: 'other')
  final SpriteOtherResource? other;

  PokemonSpriteResource(
      this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontShiny,
      this.frontShinyFemale,
      this.other);
  factory PokemonSpriteResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonSpriteResourceFromJson(json);
  }
}

@JsonSerializable()
class SpriteOtherResource {
  @JsonKey(name: 'official-artwork')
  final SpriteOfficialArtworkResource? officialArtwork;
  @JsonKey(name: 'dream_world')
  final SpriteDreamWorldResource? dreamWorld;

  SpriteOtherResource(this.officialArtwork, this.dreamWorld);
  factory SpriteOtherResource.fromJson(Map<String, dynamic> json) {
    return _$SpriteOtherResourceFromJson(json);
  }
}

@JsonSerializable()
class SpriteOfficialArtworkResource {
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  SpriteOfficialArtworkResource(this.frontDefault);
  factory SpriteOfficialArtworkResource.fromJson(Map<String, dynamic> json) {
    return _$SpriteOfficialArtworkResourceFromJson(json);
  }
}

@JsonSerializable()
class SpriteDreamWorldResource {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  SpriteDreamWorldResource(this.frontDefault, this.frontFemale);
  factory SpriteDreamWorldResource.fromJson(Map<String, dynamic> json) {
    return _$SpriteDreamWorldResourceFromJson(json);
  }
}
