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
  IntColumn get weight => integer()();
  IntColumn get baseExperience => integer()();
}

class PokemonType extends Table {
  TextColumn get type => text()();
  IntColumn get pokemonId =>
      integer().customConstraint('NOT NULL REFERENCES pokemon (id)')();
}

class PokemonAbility extends Table {
  TextColumn get name => text()();
  TextColumn get effect => text()();
  TextColumn get shortEffect => text()();
  TextColumn get language => text()();
  IntColumn get pokemonId =>
      integer().customConstraint('NOT NULL REFERENCES pokemon (id)')();
}

class Stat extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class PokemonStat extends Table {
  IntColumn get baseStat => integer()();
  IntColumn get effort => integer()();

  IntColumn get pokemonId =>
      integer().customConstraint('NOT NULL REFERENCES pokemon (id)')();
  IntColumn get statId =>
      integer().customConstraint('NOT NULL REFERENCES stat (id)')();
}

class JoinedPokemonStat {
  final PokemonStatData pokemonStat;
  final StatData stat;

  JoinedPokemonStat(this.pokemonStat, this.stat);
}

class Item extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class PokemonItem extends Table {
  IntColumn get pokemonId =>
      integer().customConstraint('NOT NULL REFERENCES pokemon (id)')();
  IntColumn get itemId =>
      integer().customConstraint('NOT NULL REFERENCES item (id)')();
}

@UseMoor(
  tables: [
    Pokemon,
    PokemonType,
    PokemonAbility,
    PokemonStat,
    PokemonItem,
    Stat,
    Item
  ],
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
