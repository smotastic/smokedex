import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokeapi/src/models/base_resource.dart';

part 'pokemon_ability_resource.g.dart';

@JsonSerializable()
class PokemonAbilityResource extends BaseResource {
  final int id;
  final String name;
  @JsonKey(name: 'effect_entries')
  final List<EffectEntryResource> effectEntries;

  PokemonAbilityResource(this.id, this.name, this.effectEntries);

  factory PokemonAbilityResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonAbilityResourceFromJson(json);
  }
}

@JsonSerializable()
class EffectEntryResource extends BaseResource {
  final String effect;
  @JsonKey(name: 'short_effect')
  final String shortEffect;
  final NamedResourceModel language;

  EffectEntryResource(this.effect, this.shortEffect, this.language);

  factory EffectEntryResource.fromJson(Map<String, dynamic> json) {
    return _$EffectEntryResourceFromJson(json);
  }
}
