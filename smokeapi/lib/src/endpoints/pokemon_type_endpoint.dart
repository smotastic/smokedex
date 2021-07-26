import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/models/pokemon_type_resource.dart';

import 'base_endpoint.dart';

class PokemonTypeEndpoint extends BaseEndpoint<PokemonTypeResource> {
  PokemonTypeEndpoint(PokeClient client) : super(client);
  @override
  Future<Either<PokeFailure, PokemonTypeResource>> get(id) async {
    final result = await client.get<PokemonTypeResource>('type/$id');
    return Right(result);
  }
}
