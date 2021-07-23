// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResource _$PokemonModelFromJson(Map<String, dynamic> json) {
  return PokemonResource(
    json['id'] as int,
    json['name'] as String,
    json['weight'] as int,
    (json['types'] as List<dynamic>)
        .map((e) => PokemonTypeResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    PokemonSpriteResource.fromJson(json['sprites'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'types': instance.types,
      'sprites': instance.sprites,
    };

PokemonTypeResource _$PokemonTypeModelFromJson(Map<String, dynamic> json) {
  return PokemonTypeResource(
    json['slot'] as int,
    NamedResourceModel.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonTypeModelToJson(PokemonTypeResource instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonSpriteResource _$PokemonSpriteModelFromJson(Map<String, dynamic> json) {
  return PokemonSpriteResource(
    json['back_default'] as String?,
    json['back_female'] as String?,
    json['back_shiny'] as String?,
    json['back_shiny_female'] as String?,
    json['front_default'] as String?,
    json['front_shiny'] as String?,
    json['front_shiny_female'] as String?,
    json['other'] == null
        ? null
        : SpriteOtherResource.fromJson(json['other'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonSpriteModelToJson(
        PokemonSpriteResource instance) =>
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

SpriteOtherResource _$SpriteOtherModelFromJson(Map<String, dynamic> json) {
  return SpriteOtherResource(
    json['official-artwork'] == null
        ? null
        : SpriteOfficialArtworkResource.fromJson(
            json['official-artwork'] as Map<String, dynamic>),
    json['dream_world'] == null
        ? null
        : SpriteDreamWorldResource.fromJson(
            json['dream_world'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpriteOtherModelToJson(SpriteOtherResource instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
      'dream_world': instance.dreamWorld,
    };

SpriteOfficialArtworkResource _$SpriteOfficialArtworkModelFromJson(
    Map<String, dynamic> json) {
  return SpriteOfficialArtworkResource(
    json['front_default'] as String?,
  );
}

Map<String, dynamic> _$SpriteOfficialArtworkModelToJson(
        SpriteOfficialArtworkResource instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

SpriteDreamWorldResource _$SpriteDreamWorldModelFromJson(
    Map<String, dynamic> json) {
  return SpriteDreamWorldResource(
    json['front_default'] as String?,
    json['front_female'] as String?,
  );
}

Map<String, dynamic> _$SpriteDreamWorldModelToJson(
        SpriteDreamWorldResource instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };
