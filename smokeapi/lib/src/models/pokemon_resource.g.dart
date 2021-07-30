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
    json['height'] as int,
    json['base_experience'] as int,
    (json['types'] as List<dynamic>)
        .map(
            (e) => PokemonTypeNamedResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    PokemonSpriteResource.fromJson(json['sprites'] as Map<String, dynamic>),
    (json['abilities'] as List<dynamic>)
        .map((e) =>
            PokemonAbilityNamedResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['stats'] as List<dynamic>)
        .map(
            (e) => PokemonStatNamedResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['held_items'] as List<dynamic>)
        .map((e) =>
            PokemonHeldItemNamedResource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonResourceToJson(PokemonResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'base_experience': instance.baseExperience,
      'types': instance.types,
      'sprites': instance.sprites,
      'abilities': instance.abilities,
      'stats': instance.stats,
      'held_items': instance.heldItems,
    };

PokemonAbilityNamedResource _$PokemonAbilityNamedResourceFromJson(
    Map<String, dynamic> json) {
  return PokemonAbilityNamedResource(
    NamedResourceModel.fromJson(json['ability'] as Map<String, dynamic>),
    json['is_hidden'] as bool,
    json['slot'] as int,
  );
}

Map<String, dynamic> _$PokemonAbilityNamedResourceToJson(
        PokemonAbilityNamedResource instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

PokemonTypeNamedResource _$PokemonTypeNamedResourceFromJson(
    Map<String, dynamic> json) {
  return PokemonTypeNamedResource(
    json['slot'] as int,
    NamedResourceModel.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonTypeNamedResourceToJson(
        PokemonTypeNamedResource instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonStatNamedResource _$PokemonStatNamedResourceFromJson(
    Map<String, dynamic> json) {
  return PokemonStatNamedResource(
    json['base_stat'] as int,
    json['effort'] as int,
    NamedResourceModel.fromJson(json['stat'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonStatNamedResourceToJson(
        PokemonStatNamedResource instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

PokemonHeldItemNamedResource _$PokemonHeldItemNamedResourceFromJson(
    Map<String, dynamic> json) {
  return PokemonHeldItemNamedResource(
    NamedResourceModel.fromJson(json['item'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonHeldItemNamedResourceToJson(
        PokemonHeldItemNamedResource instance) =>
    <String, dynamic>{
      'item': instance.item,
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
