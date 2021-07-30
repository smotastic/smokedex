// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/pokedex/data/adapter/list_pokemon_adapter.dart' as _i14;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local.dart'
    as _i8;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_memory.dart'
    as _i9;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_moor.dart'
    as _i10;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_sqlite.dart'
    as _i11;
import 'features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart'
    as _i3;
import 'features/pokedex/data/datasources/remote/cache_pokemon_ds_remote_supabase.dart'
    as _i4;
import 'features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart'
    as _i12;
import 'features/pokedex/domain/ports/list_pokemon_port.dart' as _i13;
import 'features/pokedex/domain/usecases/list_pokemon_usecase.dart' as _i15;
import 'features/pokedex/presentation/bloc/list_pokemon_cubit.dart' as _i17;
import 'features/pokemon_detail/data/adapter/detail_pokemon_adapter.dart'
    as _i6;
import 'features/pokemon_detail/domain/ports/detail_pokemon_port.dart' as _i5;
import 'features/pokemon_detail/domain/usecases/detail_pokemon_usecase.dart'
    as _i7;
import 'features/pokemon_detail/presentation/bloc/detail_pokemon_cubit.dart'
    as _i16;

const String _memory = 'memory';
const String _moor = 'moor';
const String _sqlite = 'sqlite';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CachePokemonDataSourceRemote>(
      () => _i4.CachePokemonDataSourceRemoteSupabase());
  gh.lazySingleton<_i5.DetailPokemonPort>(() => _i6.DetailPokemonAdapter());
  gh.lazySingleton<_i7.DetailPokemonUsecase>(
      () => _i7.DetailPokemonUseCaseImpl(get<_i5.DetailPokemonPort>()));
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i9.ListPokemonDataSourceLocalMemory(),
      registerFor: {_memory});
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i10.ListPokemonDataSourceLocalMoor(),
      registerFor: {_moor});
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i11.ListPokemonDataSourceLocalSqlite(),
      registerFor: {_sqlite});
  gh.lazySingleton<_i12.ListPokemonDataSourceRemote>(
      () => _i12.ListPokemonDataSourceRemoteImpl());
  gh.lazySingleton<_i13.ListPokemonPort>(() => _i14.ListPokemonAdapter(
      get<_i8.ListPokemonDataSourceLocal>(),
      get<_i12.ListPokemonDataSourceRemote>(),
      get<_i3.CachePokemonDataSourceRemote>()));
  gh.lazySingleton<_i15.ListPokemonUsecase>(
      () => _i15.ListPokemonUseCaseImpl(get<_i13.ListPokemonPort>()));
  gh.lazySingleton<_i16.DetailPokemonCubit>(
      () => _i16.DetailPokemonCubit(get<_i7.DetailPokemonUsecase>()));
  gh.lazySingleton<_i17.ListPokemonCubit>(
      () => _i17.ListPokemonCubit(get<_i15.ListPokemonUsecase>()));
  return get;
}
