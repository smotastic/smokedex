import 'package:smokeapi/src/endpoints/base_endpoint.dart';
import 'package:smokeapi/src/models/pokemodel.dart';

class PokemonEndpoint extends ApiCall<PokemonModel> {
  @override
  PokemonModel get(id) {
    return PokemonModel('1', 'ditto');
  }

  @override
  List<PokemonModel> page(num start, num offset) {
    return [PokemonModel('1', 'ditto'), PokemonModel('1', 'Fukano')];
  }
}
