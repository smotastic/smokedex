import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/features/pokemon_detail/domain/entities/pokemon_detail.dart';
import 'package:smokedex/features/pokemon_detail/domain/usecases/detail_pokemon_usecase.dart';

part 'detail_pokemon_state.dart';

@LazySingleton()
class DetailPokemonCubit extends Cubit<DetailPokemonState> {
  DetailPokemonUsecase detailPokemon;

  DetailPokemonCubit(this.detailPokemon) : super(DetailPokemonLoadingState());

  void load(num id) async {
    final result = await detailPokemon(DetailPokemonParams(id));
    emit(result.fold((failure) => DetailPokemonLoadErrorState(failure),
        (pokemon) => DetailPokemonLoadedState(pokemon)));
  }
}
