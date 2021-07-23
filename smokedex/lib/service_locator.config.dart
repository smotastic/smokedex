// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/pokedex/data/adapter/list_pokemon_adapter.dart' as _i11;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local.dart'
    as _i6;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_memory.dart'
    as _i8;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_moor.dart'
    as _i7;
import 'features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart'
    as _i9;
import 'features/pokedex/domain/ports/list_pokemon_port.dart' as _i10;
import 'features/pokedex/domain/usecases/list_pokemon_usecase.dart' as _i12;
import 'features/pokedex/presentation/bloc/list_pokemon_cubit.dart' as _i14;
import 'features/pokemon_detail/data/adapter/detail_pokemon_adapter.dart'
    as _i4;
import 'features/pokemon_detail/domain/ports/detail_pokemon_port.dart' as _i3;
import 'features/pokemon_detail/domain/usecases/detail_pokemon_usecase.dart'
    as _i5;
import 'features/pokemon_detail/presentation/bloc/detail_pokemon_cubit.dart'
    as _i13;

const String _mobile = 'mobile';
const String _web = 'web';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DetailPokemonPort>(() => _i4.DetailPokemonAdapter());
  gh.lazySingleton<_i5.DetailPokemonUsecase>(
      () => _i5.DetailPokemonUseCaseImpl(get<_i3.DetailPokemonPort>()));
  gh.lazySingleton<_i6.ListPokemonDataSourceLocal>(
      () => _i7.ListPokemonDataSourceLocalMoor(),
      registerFor: {_mobile});
  gh.lazySingleton<_i6.ListPokemonDataSourceLocal>(
      () => _i8.ListPokemonDataSourceLocalMemory(),
      registerFor: {_web});
  gh.lazySingleton<_i9.ListPokemonDataSourceRemote>(
      () => _i9.ListPokemonDataSourceRemoteImpl());
  gh.lazySingleton<_i10.ListPokemonPort>(() => _i11.ListPokemonAdapter(
      get<_i6.ListPokemonDataSourceLocal>(),
      get<_i9.ListPokemonDataSourceRemote>()));
  gh.lazySingleton<_i12.ListPokemonUsecase>(
      () => _i12.ListPokemonUseCaseImpl(get<_i10.ListPokemonPort>()));
  gh.lazySingleton<_i13.DetailPokemonCubit>(
      () => _i13.DetailPokemonCubit(get<_i5.DetailPokemonUsecase>()));
  gh.lazySingleton<_i14.ListPokemonCubit>(
      () => _i14.ListPokemonCubit(get<_i12.ListPokemonUsecase>()));
  return get;
}
