import 'package:smokeapi/src/endpoints/pokemon_endpoint.dart';

class PokeApi extends PokeApiCalls {
  final String url;

  PokeApi({this.url = 'https://pokeapi.co/api/v2/'});

  @override
  PokemonEndpoint pokemon() {
    return PokemonEndpoint();
  }
}

abstract class PokeApiCalls {
  PokemonEndpoint pokemon();
}
