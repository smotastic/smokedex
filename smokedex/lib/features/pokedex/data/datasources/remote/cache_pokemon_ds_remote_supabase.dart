import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/datasources/remote/supabase/supabase_helper.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smokedex/features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

@LazySingleton(as: CachePokemonDataSourceRemote)
class CachePokemonDataSourceRemoteSupabase
    extends CachePokemonDataSourceRemote {
  @override
  Future<Either<Failure, bool>> cache(PokemonModel model) async {
    final db = await SupabaseHelper.I.database;
    final response =
        await db.from('pokemon').insert({'name': model.name}).execute();
    if (response.error == null) {
      print('insertResponse.data: ${response.data}');
    } else {
      print(response.error);
    }
    return Future.value(Right(true));
  }
}
