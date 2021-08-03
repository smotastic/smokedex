import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/local/db_helper.dart';
import 'package:smokedex/service_locator.dart';

@LazySingleton()
@memory
class MemoryHelper extends DbHelper<Map<num, Map<String, dynamic>>> {
  final _db = <num, Map<String, dynamic>>{};

  @override
  Future<Map<num, Map<String, dynamic>>> get database async {
    return _db;
  }
}
