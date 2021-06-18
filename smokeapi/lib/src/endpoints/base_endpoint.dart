import 'package:dartz/dartz.dart';
import 'package:smokeapi/src/core/failure.dart';
import 'package:smokeapi/src/models/basemodel.dart';

abstract class ApiCall<T extends BaseModel> {
  Future<Either<PokeFailure, List<T>>> page(num start, num offset);
  Future<Either<PokeFailure, T>> get(dynamic id);
}
