import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/remote/supabase/supabase_helper.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/failures/cache_pokemon_failure.dart';

@LazySingleton(as: CachePokemonDataSourceRemote)
class CachePokemonDataSourceRemoteSupabase
    extends CachePokemonDataSourceRemote {
  @override
  Future<Either<Failure, bool>> cache(PokemonModel model) async {
    final db = await SupabaseHelper.I.database;
    final response = await db.from('pokemon').upsert({
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

    final typeUpserts = model.types.map(
      (type) => db.from('pokemon_type').upsert({'type': type, 'pokemon_id': id},
          ignoreDuplicates: true).execute(),
    );
    await Future.wait(typeUpserts);

    return Right(true);
  }
}
