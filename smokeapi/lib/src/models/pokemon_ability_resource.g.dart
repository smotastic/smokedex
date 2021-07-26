// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbilityResource _$PokemonAbilityResourceFromJson(
    Map<String, dynamic> json) {
  return PokemonAbilityResource(
    json['id'] as int,
    json['name'] as String,
    (json['effect_entries'] as List<dynamic>)
        .map((e) => EffectEntryResource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonAbilityResourceToJson(
        PokemonAbilityResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'effect_entries': instance.effectEntries,
    };

EffectEntryResource _$EffectEntryResourceFromJson(Map<String, dynamic> json) {
  return EffectEntryResource(
    json['effect'] as String,
    json['short_effect'] as String,
    NamedResourceModel.fromJson(json['language'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EffectEntryResourceToJson(
        EffectEntryResource instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'short_effect': instance.shortEffect,
      'language': instance.language,
    };
