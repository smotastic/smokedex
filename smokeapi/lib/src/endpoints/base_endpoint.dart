import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';
import 'package:smokeapi/src/models/basemodel.dart';

abstract class BaseEndpoint<T extends BaseModel> {
  final PokeClient client;

  BaseEndpoint(this.client);

  Future<Either<PokeFailure, T>> get(dynamic id);
}

abstract class PaginatedEndpoint<T extends BaseModel> extends BaseEndpoint<T> {
  PaginatedEndpoint(PokeClient client) : super(client);

  Future<Either<PokeFailure, List<T>>> page(num start, num offset);
}
