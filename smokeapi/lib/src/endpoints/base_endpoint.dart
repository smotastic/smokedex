import 'package:smokeapi/src/models/basemodel.dart';

abstract class ApiCall<T extends BaseModel> {
  List<T> page(num start, num offset);
  T get(dynamic id);
}
