import 'package:smokeapi/src/models/basemodel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/named_resource.dart';
part 'pokemodel.g.dart';

@JsonSerializable()
class PokemonResource extends BaseResource {
  final int id;
  final String name;
  final int weight;
  final List<PokemonTypeResource> types;
  final PokemonSpriteResource sprites;

  PokemonResource(this.id, this.name, this.weight, this.types, this.sprites);

  factory PokemonResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonModelFromJson(json);
  }
}

@JsonSerializable()
class PokemonTypeResource {
  final int slot;
  final NamedResourceModel type;

  PokemonTypeResource(this.slot, this.type);

  factory PokemonTypeResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonTypeModelFromJson(json);
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
    return _$PokemonSpriteModelFromJson(json);
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
    return _$SpriteOtherModelFromJson(json);
  }
}

@JsonSerializable()
class SpriteOfficialArtworkResource {
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  SpriteOfficialArtworkResource(this.frontDefault);
  factory SpriteOfficialArtworkResource.fromJson(Map<String, dynamic> json) {
    return _$SpriteOfficialArtworkModelFromJson(json);
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
    return _$SpriteDreamWorldModelFromJson(json);
  }
}
