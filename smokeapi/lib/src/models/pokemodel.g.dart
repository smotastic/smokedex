// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return PokemonModel(
    json['id'] as int,
    json['name'] as String,
    json['weight'] as int,
    PokemonSpriteModel.fromJson(json['sprites'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'sprites': instance.sprites,
    };

PokemonSpriteModel _$PokemonSpriteModelFromJson(Map<String, dynamic> json) {
  return PokemonSpriteModel(
    json['back_default'] as String?,
    json['back_female'] as String?,
    json['back_shiny'] as String?,
    json['back_shiny_female'] as String?,
    json['front_default'] as String?,
    json['front_shiny'] as String?,
    json['front_shiny_female'] as String?,
    json['other'] == null
        ? null
        : SpriteOtherModel.fromJson(json['other'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonSpriteModelToJson(PokemonSpriteModel instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'other': instance.other,
    };

SpriteOtherModel _$SpriteOtherModelFromJson(Map<String, dynamic> json) {
  return SpriteOtherModel(
    json['official-artwork'] == null
        ? null
        : SpriteOfficialArtworkModel.fromJson(
            json['official-artwork'] as Map<String, dynamic>),
    json['dream_world'] == null
        ? null
        : SpriteDreamWorldModel.fromJson(
            json['dream_world'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpriteOtherModelToJson(SpriteOtherModel instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
      'dream_world': instance.dreamWorld,
    };

SpriteOfficialArtworkModel _$SpriteOfficialArtworkModelFromJson(
    Map<String, dynamic> json) {
  return SpriteOfficialArtworkModel(
    json['front_default'] as String?,
  );
}

Map<String, dynamic> _$SpriteOfficialArtworkModelToJson(
        SpriteOfficialArtworkModel instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

SpriteDreamWorldModel _$SpriteDreamWorldModelFromJson(
    Map<String, dynamic> json) {
  return SpriteDreamWorldModel(
    json['front_default'] as String?,
    json['front_female'] as String?,
  );
}

Map<String, dynamic> _$SpriteDreamWorldModelToJson(
        SpriteDreamWorldModel instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };
