import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/endpoints/pokemon_endpoint.dart';

class PokeApi extends PokeApiCalls {
  final PokeClient client;

  PokeApi({url = 'https://pokeapi.co/api/v2/'})
      : client = PokeRemoteClient(url: url);

  @override
  PokemonEndpoint pokemon() {
    return PokemonEndpoint(client);
  }
}

abstract class PokeApiCalls {
  PokemonEndpoint pokemon();
}
