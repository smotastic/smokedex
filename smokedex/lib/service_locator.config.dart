// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/pokedex/data/adapter/list_pokemon_adapter.dart' as _i9;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local.dart'
    as _i4;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_sqlite.dart'
    as _i5;
import 'features/pokedex/data/datasources/local/list_pokemon_ds_local_stub.dart'
    as _i6;
import 'features/pokedex/data/datasources/remote/list_pokemon_ds_remote.dart'
    as _i7;
import 'features/pokedex/domain/ports/list_pokemon_port.dart' as _i8;
import 'features/pokedex/domain/usecases/list_pokemon_usecase.dart' as _i10;
import 'features/pokedex/presentation/bloc/detail_pokemon_bloc.dart' as _i3;
import 'features/pokedex/presentation/bloc/list_pokemon_cubit.dart' as _i11;

const String _mobile = 'mobile';
const String _web = 'web';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DetailPokemonBloc>(() => _i3.DetailPokemonBloc());
  gh.lazySingleton<_i4.ListPokemonDataSourceLocal>(
      () => _i5.ListPokemonDataSourceLocalSqlite(),
      registerFor: {_mobile});
  gh.lazySingleton<_i4.ListPokemonDataSourceLocal>(
      () => _i6.ListPokemonDataSourceLocalStub(),
      registerFor: {_web});
  gh.lazySingleton<_i7.ListPokemonDataSourceRemote>(
      () => _i7.ListPokemonDataSourceRemoteImpl());
  gh.lazySingleton<_i8.ListPokemonPort>(() => _i9.ListPokemonAdapter(
      get<_i4.ListPokemonDataSourceLocal>(),
      get<_i7.ListPokemonDataSourceRemote>()));
  gh.lazySingleton<_i10.ListPokemonUsecase>(
      () => _i10.ListPokemonUseCaseImpl(get<_i8.ListPokemonPort>()));
  gh.lazySingleton<_i11.ListPokemonCubit>(
      () => _i11.ListPokemonCubit(get<_i10.ListPokemonUsecase>()));
  return get;
}
