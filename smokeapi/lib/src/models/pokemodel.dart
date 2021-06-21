import 'package:smokeapi/src/models/basemodel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pokemodel.g.dart';

@JsonSerializable()
class PokemonModel extends BaseModel {
  final String id;
  final String name;

  PokemonModel(this.id, this.name);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonModelFromJson(json);
  }
}
