import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/remote/supabase/supabase_helper.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/failures/cache_pokemon_failure.dart';
import 'package:supabase/supabase.dart';

@LazySingleton(as: CachePokemonDataSourceRemote)
class CachePokemonDataSourceRemoteSupabase
    extends CachePokemonDataSourceRemote {
  @override
  Future<Either<Failure, bool>> cache(PokemonModel model) async {
    final db = await SupabaseHelper.I.database;
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

    // ABILITY
    final abilityUpserts = model.abilities.map(
      (ability) => db.from('pokemon_ability').upsert({
        'name': ability.name,
        'effect': ability.effect,
        'shorteffect': ability.shortEffect,
        'language': ability.language,
        'pokemon_id': id
      }, ignoreDuplicates: true).execute(),
    );
    await Future.wait(abilityUpserts);

    // TYPES
    final typeUpserts = model.types.map(
      (type) => db.from('pokemon_type').upsert({'type': type, 'pokemon_id': id},
          ignoreDuplicates: true).execute(),
    );
    await Future.wait(typeUpserts);

    // STATS
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

      await db.from('pokemon_stat').upsert({
        'basestat': stat.baseStat,
        'effort': stat.effort,
        'pokemon_id': id,
        'stat_id': statId
      }).execute();
    }

    // ITEMS
    for (var item in model.heldItems) {
      print(item);
      int? itemId = await _findExistingIdForName(db, 'item', item.name);
      print('found itemId $itemId');
      // if not there, create it
      if (itemId == null) {
        final itemResp = await db.from('item').upsert({'name': item.name},
            ignoreDuplicates: true, onConflict: 'name').execute();
        final itemResult = itemResp.data as List<dynamic>;
        if (itemResult.isNotEmpty) {
          itemId = itemResult[0]['id']!;
        }
      }

      await db
          .from('pokemon_item')
          .upsert({'pokemon_id': id, 'item_id': itemId}).execute();
    }

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
}
