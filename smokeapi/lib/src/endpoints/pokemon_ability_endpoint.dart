import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/models/pokemon_ability_resource.dart';

import 'base_endpoint.dart';

class PokemonAbilityEndpoint extends BaseEndpoint<PokemonAbilityResource> {
  PokemonAbilityEndpoint(PokeClient client) : super(client);
  @override
  Future<Either<PokeFailure, PokemonAbilityResource>> get(id) async {
    final result = await client.get<PokemonAbilityResource>('ability/$id');
    return Right(result);
  }
}
