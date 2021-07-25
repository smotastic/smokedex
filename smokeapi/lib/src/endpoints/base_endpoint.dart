import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/client.dart';
import 'package:smokeapi/src/core/failure.dart';
import 'package:smokeapi/src/models/base_resource.dart';
import 'package:smokeapi/src/models/pagination.dart';

abstract class BaseEndpoint<T extends BaseResource> {
  final PokeClient client;

  BaseEndpoint(this.client);

  Future<Either<PokeFailure, T>> get(dynamic id);
}

abstract class PaginatedEndpoint<T extends BaseResource>
    extends BaseEndpoint<T> {
  PaginatedEndpoint(PokeClient client) : super(client);

  Future<Either<PokeFailure, Pagination>> page(num pageSize, num offset);
}
