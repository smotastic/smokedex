import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/local/db_helper.dart';
import 'package:floor/floor.dart';
import 'package:smokedex/service_locator.dart';

import 'database/floor_database.dart';

@LazySingleton()
@floor
class FloorHelper extends DbHelper<AppDatabase> {
  AppDatabase? _db;
  @override
  Future<AppDatabase> get database async => _db ?? await initDb();

  Future<AppDatabase> initDb() async {
    final db =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    _db = db;
    return _db!;
  }
}

@entity
class PokemonFloor {
  @primaryKey
  final int id;
  final String name;
  final String imageUrl;
  final int weight;
  final int baseExperience;

  PokemonFloor(
      this.id, this.name, this.imageUrl, this.weight, this.baseExperience);
}

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM PokemonFloor limit :pageSize offset :offset')
  Future<List<PokemonFloor>> findPokemonPage(int pageSize, int offset);

  @insert
  Future<void> insertPokemon(PokemonFloor pokemon);
}
