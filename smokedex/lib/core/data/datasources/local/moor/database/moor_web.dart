import 'package:moor/moor_web.dart';
import 'package:smokedex/core/data/datasources/local/moor/moor_helper.dart';

Database constructDb({bool logStatements = false}) {
  return Database(WebDatabase('db', logStatements: logStatements));
}
