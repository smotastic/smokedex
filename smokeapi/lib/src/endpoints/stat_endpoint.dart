import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/models/stat_resource.dart';

import 'base_endpoint.dart';

class StatEndpoint extends BaseEndpoint<StatResource> {
  StatEndpoint(PokeClient client) : super(client);
  @override
  Future<Either<PokeFailure, StatResource>> get(id) async {
    final result = await client.get<StatResource>('stat/$id');
    return Right(result);
  }
}
