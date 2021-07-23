import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;
part 'moor_helper.g.dart';

class MoorHelper {
  MoorHelper._();

  static final I = MoorHelper._();

  Database? _database;

  Future<Database> get database async {
    return _database ?? await constructDb(logStatements: false);
  }

  Database constructDb({bool logStatements = false}) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'pokemonmoor.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return Database(executor);
  }
}

class Pokemon extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get image => text()();
}

class PokemonType extends Table {
  TextColumn get type => text()();
  IntColumn get pokemonId =>
      integer().customConstraint('NOT NULL REFERENCES pokemon (id)')();
}

@UseMoor(
  tables: [Pokemon, PokemonType],
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }
}
