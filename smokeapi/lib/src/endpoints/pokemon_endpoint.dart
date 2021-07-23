import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';
import 'package:smokeapi/src/endpoints/base_endpoint.dart';
import 'package:smokeapi/src/models/pokemodel.dart';
import 'package:smokeapi/src/models/pagination.dart';

class PokemonEndpoint extends PaginatedEndpoint<PokemonResource> {
  PokemonEndpoint(PokeClient client) : super(client);

  @override
  Future<Either<PokeFailure, PokemonResource>> get(id) async {
    final result = await client.get<PokemonResource>('pokemon/$id');
    return Right(result);
  }

  @override
  Future<Either<PokeFailure, Pagination>> page(num pageSize, num offset) async {
    // ?limit=$pageSize&offset=$offset
    final result = await client.get<Pagination>('pokemon',
        queryParams: {'limit': '$pageSize', 'offset': '$offset'});
    return Right(result);
  }
}
