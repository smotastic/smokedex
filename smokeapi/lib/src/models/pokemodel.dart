import 'package:smokeapi/src/models/basemodel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pokemodel.g.dart';

@JsonSerializable()
class PokemonModel extends BaseModel {
  final int id;
  final String name;
  final int weight;
  final PokemonSpriteModel sprites;

  PokemonModel(this.id, this.name, this.weight, this.sprites);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonModelFromJson(json);
  }
}

@JsonSerializable()
class PokemonSpriteModel {
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
  final SpriteOtherModel? other;

  PokemonSpriteModel(
      this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontShiny,
      this.frontShinyFemale,
      this.other);
  factory PokemonSpriteModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonSpriteModelFromJson(json);
  }
}

@JsonSerializable()
class SpriteOtherModel {
  @JsonKey(name: 'official-artwork')
  final SpriteOfficialArtworkModel? officialArtwork;
  @JsonKey(name: 'dream_world')
  final SpriteDreamWorldModel? dreamWorld;

  SpriteOtherModel(this.officialArtwork, this.dreamWorld);
  factory SpriteOtherModel.fromJson(Map<String, dynamic> json) {
    return _$SpriteOtherModelFromJson(json);
  }
}

@JsonSerializable()
class SpriteOfficialArtworkModel {
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  SpriteOfficialArtworkModel(this.frontDefault);
  factory SpriteOfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return _$SpriteOfficialArtworkModelFromJson(json);
  }
}

@JsonSerializable()
class SpriteDreamWorldModel {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  SpriteDreamWorldModel(this.frontDefault, this.frontFemale);
  factory SpriteDreamWorldModel.fromJson(Map<String, dynamic> json) {
    return _$SpriteDreamWorldModelFromJson(json);
  }
}
