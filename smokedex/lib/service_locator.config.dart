// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/datasources/local/floor/floor_helper.dart' as _i6;
import 'core/data/datasources/local/hive/hive_helper.dart' as _i7;
import 'core/data/datasources/local/memory/memory_helper.dart' as _i12;
import 'core/data/datasources/local/moor/moor_helper.dart' as _i13;
import 'core/data/datasources/local/sqflite/sqflite_helper.dart' as _i14;
import 'core/data/datasources/remote/supabase/supabase_helper.dart' as _i15;
import 'features/pokedex/data/adapter/list_pokemon_adapter.dart' as _i23;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local.dart'
    as _i8;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_floor.dart'
    as _i10;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_hive.dart'
    as _i9;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_memory.dart'
    as _i19;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_moor.dart'
    as _i20;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_sqlite.dart'
    as _i21;
import 'features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart'
    as _i16;
import 'features/pokedex/data/datasources/remote/cache_pokemon_ds_remote_supabase.dart'
    as _i17;
import 'features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart'
    as _i11;
import 'features/pokedex/domain/ports/list_pokemon_port.dart' as _i22;
import 'features/pokedex/domain/usecases/list_pokemon_usecase.dart' as _i24;
import 'features/pokedex/presentation/bloc/list_pokemon_cubit.dart' as _i25;
import 'features/pokemon_detail/data/adapter/detail_pokemon_adapter.dart'
    as _i4;
import 'features/pokemon_detail/domain/ports/detail_pokemon_port.dart' as _i3;
import 'features/pokemon_detail/domain/usecases/detail_pokemon_usecase.dart'
    as _i5;
import 'features/pokemon_detail/presentation/bloc/detail_pokemon_cubit.dart'
    as _i18;

const String _floor = 'floor';
const String _hive = 'hive';
const String _memory = 'memory';
const String _moor = 'moor';
const String _sqlite = 'sqlite';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DetailPokemonPort>(() => _i4.DetailPokemonAdapter());
  gh.lazySingleton<_i5.DetailPokemonUsecase>(
      () => _i5.DetailPokemonUseCaseImpl(get<_i3.DetailPokemonPort>()));
  gh.lazySingleton<_i6.FloorHelper>(() => _i6.FloorHelper(),
      registerFor: {_floor});
  gh.lazySingleton<_i7.HiveHelper>(() => _i7.HiveHelper(),
      registerFor: {_hive});
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i9.ListPokemonDataSourceLocalHive(get<_i7.HiveHelper>()),
      registerFor: {_hive});
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i10.ListPokemonDataSourceLocalFloor(get<_i6.FloorHelper>()),
      registerFor: {_floor});
  gh.lazySingleton<_i11.ListPokemonDataSourceRemote>(
      () => _i11.ListPokemonDataSourceRemoteImpl());
  gh.lazySingleton<_i12.MemoryHelper>(() => _i12.MemoryHelper(),
      registerFor: {_memory});
  gh.lazySingleton<_i13.MoorHelper>(() => _i13.MoorHelper(),
      registerFor: {_moor});
  gh.lazySingleton<_i14.SqfliteHelper>(() => _i14.SqfliteHelper(),
      registerFor: {_sqlite});
  gh.lazySingleton<_i15.SupabaseHelper>(() => _i15.SupabaseHelper());
  gh.lazySingleton<_i16.CachePokemonDataSourceRemote>(() =>
      _i17.CachePokemonDataSourceRemoteSupabase(get<_i15.SupabaseHelper>()));
  gh.lazySingleton<_i18.DetailPokemonCubit>(
      () => _i18.DetailPokemonCubit(get<_i5.DetailPokemonUsecase>()));
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i19.ListPokemonDataSourceLocalMemory(get<_i12.MemoryHelper>()),
      registerFor: {_memory});
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i20.ListPokemonDataSourceLocalMoor(get<_i13.MoorHelper>()),
      registerFor: {_moor});
  gh.lazySingleton<_i8.ListPokemonDataSourceLocal>(
      () => _i21.ListPokemonDataSourceLocalSqlite(get<_i14.SqfliteHelper>()),
      registerFor: {_sqlite});
  gh.lazySingleton<_i22.ListPokemonPort>(() => _i23.ListPokemonAdapter(
      get<_i8.ListPokemonDataSourceLocal>(),
      get<_i11.ListPokemonDataSourceRemote>(),
      get<_i16.CachePokemonDataSourceRemote>()));
  gh.lazySingleton<_i24.ListPokemonUsecase>(
      () => _i24.ListPokemonUseCaseImpl(get<_i22.ListPokemonPort>()));
  gh.lazySingleton<_i25.ListPokemonCubit>(
      () => _i25.ListPokemonCubit(get<_i24.ListPokemonUsecase>()));
  return get;
}
