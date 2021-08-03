import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/remote/supabase/supabase_helper.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/failures/cache_pokemon_failure.dart';
import 'package:supabase/supabase.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: CachePokemonDataSourceRemote)
class CachePokemonDataSourceRemoteSupabase
    extends CachePokemonDataSourceRemote {
  final SupabaseHelper helper;
  late final Future<SupabaseClient> _db;
  late final http.Client _client;

  CachePokemonDataSourceRemoteSupabase(this.helper) {
    this._db = helper.database;
    _client = new http.Client();
  }

  @override
  Future<Either<Failure, bool>> cache(PokemonModel model) async {
    final db = await _db;

    final response = await db.from('pokemon').upsert({
      'num': model.id,
      'name': model.name,
      'weight': model.weight,
      'baseexperience': model.baseExperience
    }, onConflict: 'name').execute();
    if (response.error != null) {
      print(response.error);
      return Left(CachePokemonFailure.args([response.error!.code ?? '']));
    }
    List<dynamic> result = response.data;
    if (result.isEmpty) {
      return Left(CachePokemonFailure());
    }
    final id = result[0]['id']!;

    await _uploadUrl(model.name, model.imageUrl);

    // ABILITY
    final abilityUpserts = model.abilities
        .map((ability) => {
              'name': ability.name,
              'effect': ability.effect,
              'shorteffect': ability.shortEffect,
              'language': ability.language,
              'pokemon_id': id
            })
        .toList();
    await db
        .from('pokemon_ability')
        .upsert(abilityUpserts,
            ignoreDuplicates: true, onConflict: 'name,pokemon_id')
        .execute();

    // TYPES
    final typeUpserts =
        model.types.map((type) => {'type': type, 'pokemon_id': id}).toList();
    await db
        .from('pokemon_type')
        .upsert(typeUpserts,
            ignoreDuplicates: true, onConflict: 'type,pokemon_id')
        .execute();

    // STATS
    final statUpserts = [];
    for (var stat in model.stats) {
      int? statId = await _findExistingIdForName(db, 'stat', stat.name);

      // if not there, create it
      if (statId == null) {
        final statResp = await db.from('stat').upsert({'name': stat.name},
            ignoreDuplicates: true, onConflict: 'name').execute();
        final statResult = statResp.data as List<dynamic>;
        if (statResult.isNotEmpty) {
          statId = statResult[0]['id']!;
        }
      }
      statUpserts.add({
        'basestat': stat.baseStat,
        'effort': stat.effort,
        'pokemon_id': id,
        'stat_id': statId
      });
    }
    await db
        .from('pokemon_stat')
        .upsert(statUpserts, onConflict: 'pokemon_id,stat_id')
        .execute();

    // ITEMS
    final itemUpserts = [];
    for (var item in model.heldItems) {
      int? itemId = await _findExistingIdForName(db, 'item', item.name);
      // if not there, create it
      if (itemId == null) {
        final itemResp = await db.from('item').upsert({'name': item.name},
            ignoreDuplicates: true, onConflict: 'name').execute();
        final itemResult = itemResp.data as List<dynamic>;
        if (itemResult.isNotEmpty) {
          itemId = itemResult[0]['id']!;
        }
      }
      itemUpserts.add({'pokemon_id': id, 'item_id': itemId});
    }
    await db
        .from('pokemon_item')
        .upsert(itemUpserts, onConflict: 'pokemon_id,item_id')
        .execute();
    return Right(true);
  }

  Future<int?> _findExistingIdForName(
      SupabaseClient db, String table, String name) async {
    final existingItemResp =
        await db.from(table).select('id').filter('name', 'eq', name).execute();

    int? id;
    // first check for existing stat
    if (existingItemResp.error == null) {
      final existingStat = existingItemResp.data as List<dynamic>;
      if (existingStat.isNotEmpty) {
        id = existingStat[0]['id'];
      }
    }
    return id;
  }

  Future<void> _uploadUrl(String name, String url) async {
    final db = await _db;
    var req = await _client.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    final resp = await db.storage.from('pokemon-storage').uploadBinary(
        'public/$name.jpg', bytes,
        fileOptions: FileOptions(upsert: true));
    if (resp.error != null) {
      print(resp.error!.message);
    }
  }
}
