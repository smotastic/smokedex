// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/pokedex/data/adapter/list_pokemon_adapter.dart' as _i4;
import 'features/pokedex/domain/ports/list_pokemon_port.dart' as _i3;
import 'features/pokedex/domain/usecases/list_pokemon_usecase.dart' as _i5;
import 'features/pokedex/presentation/bloc/list_pokemon_bloc.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ListPokemonPort>(() => _i4.ListPokemonAdapter());
  gh.lazySingleton<_i5.ListPokemonUsecase>(
      () => _i5.ListPokemonUseCaseImpl(get<_i3.ListPokemonPort>()));
  gh.factory<_i6.ListPokemonBloc>(
      () => _i6.ListPokemonBloc(get<_i5.ListPokemonUsecase>()));
  return get;
}
