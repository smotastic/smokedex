import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/base_resource.dart';

part 'pokemon_ability_resource.g.dart';

@JsonSerializable()
class PokemonAbilityResource extends BaseResource {
  final int id;
  final String name;

  PokemonAbilityResource(this.id, this.name);

  factory PokemonAbilityResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonAbilityResourceFromJson(json);
  }
}
