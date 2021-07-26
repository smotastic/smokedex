import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/base_resource.dart';

part 'pokemon_type_resource.g.dart';

@JsonSerializable()
class PokemonTypeResource extends BaseResource {
  final String name;

  PokemonTypeResource(this.name);

  factory PokemonTypeResource.fromJson(Map<String, dynamic> json) {
    return _$PokemonTypeResourceFromJson(json);
  }
}
