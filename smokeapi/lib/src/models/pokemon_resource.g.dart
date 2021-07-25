// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResource _$PokemonResourceFromJson(Map<String, dynamic> json) {
  return PokemonResource(
    json['id'] as int,
    json['name'] as String,
    json['weight'] as int,
    json['base_experience'] as int,
    (json['types'] as List<dynamic>)
        .map((e) => PokemonTypeResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    PokemonSpriteResource.fromJson(json['sprites'] as Map<String, dynamic>),
    (json['abilities'] as List<dynamic>)
        .map((e) => PokemonAbilityResource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonResourceToJson(PokemonResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'types': instance.types,
      'sprites': instance.sprites,
      'abilities': instance.abilities,
    };

PokemonAbilityResource _$PokemonAbilityResourceFromJson(
    Map<String, dynamic> json) {
  return PokemonAbilityResource(
    NamedResourceModel.fromJson(json['ability'] as Map<String, dynamic>),
    json['is_hidden'] as bool,
    json['slot'] as int,
  );
}

Map<String, dynamic> _$PokemonAbilityResourceToJson(
        PokemonAbilityResource instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

PokemonTypeResource _$PokemonTypeResourceFromJson(Map<String, dynamic> json) {
  return PokemonTypeResource(
    json['slot'] as int,
    NamedResourceModel.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonTypeResourceToJson(
        PokemonTypeResource instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonSpriteResource _$PokemonSpriteResourceFromJson(
    Map<String, dynamic> json) {
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

Map<String, dynamic> _$PokemonSpriteResourceToJson(
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

SpriteOtherResource _$SpriteOtherResourceFromJson(Map<String, dynamic> json) {
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

Map<String, dynamic> _$SpriteOtherResourceToJson(
        SpriteOtherResource instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
      'dream_world': instance.dreamWorld,
    };

SpriteOfficialArtworkResource _$SpriteOfficialArtworkResourceFromJson(
    Map<String, dynamic> json) {
  return SpriteOfficialArtworkResource(
    json['front_default'] as String?,
  );
}

Map<String, dynamic> _$SpriteOfficialArtworkResourceToJson(
        SpriteOfficialArtworkResource instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

SpriteDreamWorldResource _$SpriteDreamWorldResourceFromJson(
    Map<String, dynamic> json) {
  return SpriteDreamWorldResource(
    json['front_default'] as String?,
    json['front_female'] as String?,
  );
}

Map<String, dynamic> _$SpriteDreamWorldResourceToJson(
        SpriteDreamWorldResource instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };