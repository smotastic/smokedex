import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:smokedex/core/data/datasources/local/floor/floor_helper.dart';

part 'floor_database.g.dart';

@Database(version: 1, entities: [PokemonFloor])
abstract class AppDatabase extends FloorDatabase {
  PokemonDao get pokemonDao;
}
