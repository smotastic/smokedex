// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/datasources/local/hive/hive_helper.dart' as _i8;
import 'core/data/datasources/local/memory/memory_helper.dart' as _i15;
import 'core/data/datasources/local/moor/moor_helper.dart' as _i16;
import 'core/data/datasources/local/sqflite/sqflite_helper.dart' as _i17;
import 'features/pokedex/data/adapter/list_pokemon_adapter.dart' as _i13;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local.dart'
    as _i9;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_hive.dart'
    as _i10;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_memory.dart'
    as _i20;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_moor.dart'
    as _i21;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_sqlite.dart'
    as _i22;
import 'features/pokedex/data/datasources/remote/cache_pokemon_ds_remote.dart'
    as _i3;
import 'features/pokedex/data/datasources/remote/cache_pokemon_ds_remote_supabase.dart'
    as _i4;
import 'features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart'
    as _i11;
import 'features/pokedex/domain/ports/list_pokemon_port.dart' as _i12;
import 'features/pokedex/domain/usecases/list_pokemon_usecase.dart' as _i14;
import 'features/pokedex/presentation/bloc/list_pokemon_cubit.dart' as _i19;
import 'features/pokemon_detail/data/adapter/detail_pokemon_adapter.dart'
    as _i6;
import 'features/pokemon_detail/domain/ports/detail_pokemon_port.dart' as _i5;
import 'features/pokemon_detail/domain/usecases/detail_pokemon_usecase.dart'
    as _i7;
import 'features/pokemon_detail/presentation/bloc/detail_pokemon_cubit.dart'
    as _i18;

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
  gh.lazySingleton<_i3.CachePokemonDataSourceRemote>(
      () => _i4.CachePokemonDataSourceRemoteSupabase());
  gh.lazySingleton<_i5.DetailPokemonPort>(() => _i6.DetailPokemonAdapter());
  gh.lazySingleton<_i7.DetailPokemonUsecase>(
      () => _i7.DetailPokemonUseCaseImpl(get<_i5.DetailPokemonPort>()));
  gh.lazySingleton<_i8.HiveHelper>(() => _i8.HiveHelper(),
      registerFor: {_hive});
  gh.lazySingleton<_i9.ListPokemonDataSourceLocal>(
      () => _i10.ListPokemonDataSourceLocalHive(get<_i8.HiveHelper>()),
      registerFor: {_hive});
  gh.lazySingleton<_i11.ListPokemonDataSourceRemote>(
      () => _i11.ListPokemonDataSourceRemoteImpl());
  gh.lazySingleton<_i12.ListPokemonPort>(() => _i13.ListPokemonAdapter(
      get<_i9.ListPokemonDataSourceLocal>(),
      get<_i11.ListPokemonDataSourceRemote>(),
      get<_i3.CachePokemonDataSourceRemote>()));
  gh.lazySingleton<_i14.ListPokemonUsecase>(
      () => _i14.ListPokemonUseCaseImpl(get<_i12.ListPokemonPort>()));
  gh.lazySingleton<_i15.MemoryHelper>(() => _i15.MemoryHelper(),
      registerFor: {_memory});
  gh.lazySingleton<_i16.MoorHelper>(() => _i16.MoorHelper(),
      registerFor: {_moor});
  gh.lazySingleton<_i17.SqfliteHelper>(() => _i17.SqfliteHelper(),
      registerFor: {_sqlite});
  gh.lazySingleton<_i18.DetailPokemonCubit>(
      () => _i18.DetailPokemonCubit(get<_i7.DetailPokemonUsecase>()));
  gh.lazySingleton<_i19.ListPokemonCubit>(
      () => _i19.ListPokemonCubit(get<_i14.ListPokemonUsecase>()));
  gh.lazySingleton<_i9.ListPokemonDataSourceLocal>(
      () => _i20.ListPokemonDataSourceLocalMemory(get<_i15.MemoryHelper>()),
      registerFor: {_memory});
  gh.lazySingleton<_i9.ListPokemonDataSourceLocal>(
      () => _i21.ListPokemonDataSourceLocalMoor(get<_i16.MoorHelper>()),
      registerFor: {_moor});
  gh.lazySingleton<_i9.ListPokemonDataSourceLocal>(
      () => _i22.ListPokemonDataSourceLocalSqlite(get<_i17.SqfliteHelper>()),
      registerFor: {_sqlite});
  return get;
}
