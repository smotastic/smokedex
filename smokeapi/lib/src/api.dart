import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/endpoints/pokemon_ability_endpoint.dart';
import 'package:smokeapi/src/endpoints/pokemon_endpoint.dart';
import 'package:smokeapi/src/endpoints/pokemon_type_endpoint.dart';

class PokeApi extends PokeApiCalls {
  final PokeClient client;

  PokeApi({url = 'pokeapi.co', apiVersion = '/api/v2/'})
      : client = PokeRemoteClient(url: url, apiVersion: apiVersion);

  @override
  PokemonEndpoint pokemon() {
    return PokemonEndpoint(client);
  }

  @override
  PokemonAbilityEndpoint ability() {
    return PokemonAbilityEndpoint(client);
  }

  @override
  PokemonTypeEndpoint type() {
    return PokemonTypeEndpoint(client);
  }
}

abstract class PokeApiCalls {
  PokemonEndpoint pokemon();
  PokemonAbilityEndpoint ability();
  PokemonTypeEndpoint type();
}
