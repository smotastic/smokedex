import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';
import 'package:smokeapi/src/endpoints/base_endpoint.dart';
import 'package:smokeapi/src/models/pokemodel.dart';

class PokemonEndpoint extends PaginatedEndpoint<PokemonModel> {
  PokemonEndpoint(PokeClient client) : super(client);

  @override
  Future<Either<PokeFailure, PokemonModel>> get(id) async {
    return Right(PokemonModel('1', 'ditto'));
  }

  @override
  Future<Either<PokeFailure, List<PokemonModel>>> page(
      num start, num offset) async {
    return Right([PokemonModel('1', 'ditto'), PokemonModel('2', 'Fukano')]);
  }
}
