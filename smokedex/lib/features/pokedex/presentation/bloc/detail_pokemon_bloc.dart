import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/domain/failure.dart';
import 'package:smokedex/core/domain/usecase.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/domain/usecases/list_pokemon_usecase.dart';

part 'detail_pokemon_event.dart';

part 'detail_pokemon_state.dart';

@injectable
class DetailPokemonBloc extends Bloc<DetailPokemonEvent, DetailPokemonState> {
  DetailPokemonBloc() : super(DetailPokemonLoadingState());

  @override
  Stream<DetailPokemonState> mapEventToState(DetailPokemonEvent event) async* {
    yield DetailPokemonLoadingState();
    // if (event is ListPokemonRequestedEvent) {
    //   final result = await listPokemonUseCase(
    //       ListPokemonParams(event.pageSize, event.offset));
    //   yield result.fold((l) => ListPokemonLoadErrorState(l),
    //       (r) => ListPokemonLoadedState(r));
    // }
  }
}
