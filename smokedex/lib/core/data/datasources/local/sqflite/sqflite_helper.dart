import 'package:path_provider/path_provider.dart';
import 'package:smokedex/core/data/meta/pokemon_meta.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

class SqfliteHelper {
  SqfliteHelper._();

  static final I = SqfliteHelper._();

  Database? _database;

  Future<Database> get database async {
    return _database ?? await initDB();
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'pokemon');
    _database = await openDatabase(path, version: 2, onCreate: _onCreate);
    return _database;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${PokemonSqlMeta.table} (
          ${PokemonSqlMeta.id} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${PokemonSqlMeta.name} TEXT NOT NULL,
          ${PokemonSqlMeta.image} TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE ${PokemonTypeSqlMeta.table} (
          ${PokemonTypeSqlMeta.type} TEXT NOT NULL,
          ${PokemonTypeSqlMeta.pokemonId} INTEGER,
          FOREIGN KEY(${PokemonTypeSqlMeta.pokemonId}) REFERENCES ${PokemonSqlMeta.table}(${PokemonSqlMeta.id})
      )    
      ''');

    // await db.insert(PokemonTypeSqlMeta.table,
    //     {PokemonTypeSqlMeta.type: 'grass', PokemonTypeSqlMeta.pokemonId: 1});
    // await db.insert(PokemonTypeSqlMeta.table,
    //     {PokemonTypeSqlMeta.type: 'fire', PokemonTypeSqlMeta.pokemonId: 1});
    // await db.insert(PokemonTypeSqlMeta.table,
    //     {PokemonTypeSqlMeta.type: 'water', PokemonTypeSqlMeta.pokemonId: 2});

    // await db.insert(PokemonSqlMeta.table, {
    //   PokemonSqlMeta.id: 1,
    //   PokemonSqlMeta.name: 'Bisa',
    //   PokemonSqlMeta.image:
    //       'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png'
    // });

    // await db.insert(PokemonSqlMeta.table, {
    //   PokemonSqlMeta.id: 2,
    //   PokemonSqlMeta.name: 'Glu',
    //   PokemonSqlMeta.image:
    //       'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png'
    // });
  }
}
