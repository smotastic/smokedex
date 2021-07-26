import 'package:moor/moor.dart';
import 'database/moor_database.dart';
part 'moor_helper.g.dart';

class MoorHelper {
  MoorHelper._();

  static final I = MoorHelper._();

  Database? _database;

  Future<Database> get database async {
    return _database ?? await constructDb(logStatements: false);
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
