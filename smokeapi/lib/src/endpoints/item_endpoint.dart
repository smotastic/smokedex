import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/models/item_resource.dart';

import 'base_endpoint.dart';

class ItemEndpoint extends BaseEndpoint<ItemResource> {
  ItemEndpoint(PokeClient client) : super(client);
  @override
  Future<Either<PokeFailure, ItemResource>> get(id) async {
    final result = await client.get<ItemResource>('stat/$id');
    return Right(result);
  }
}
