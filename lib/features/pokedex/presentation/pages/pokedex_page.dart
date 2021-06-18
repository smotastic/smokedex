import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/presentation/bloc/list_pokemon_bloc.dart';
import 'package:smokedex/features/pokedex/presentation/widgets/pokemon_list_card.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I<ListPokemonBloc>()..add(ListPokemonRequestedEvent()),
      child: PokedexView(),
    );
  }
}

class PokedexView extends StatelessWidget {
  const PokedexView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: BlocBuilder<ListPokemonBloc, ListPokemonState>(
          builder: (context, state) {
        if (state is ListPokemonLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ListPokemonLoadedState) {
          return ListView.builder(
            itemBuilder: (_, i) {
              PokemonEntry entry = state.pokemons[i];
              return PokemonListCard(entry);
            },
            itemCount: state.pokemons.length,
          );
        }
        return Container();
      }),
    );
  }
}
