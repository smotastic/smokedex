import 'package:smokeapi/src/models/basemodel.dart';

class PokemonModel extends BaseModel {
  final String id;
  final String name;

  PokemonModel(this.id, this.name);
}
