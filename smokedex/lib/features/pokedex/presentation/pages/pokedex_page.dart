import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/presentation/bloc/list_pokemon_cubit.dart';
import 'package:smokedex/features/pokedex/presentation/widgets/pokemon_list_card.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ListPokemonCubit>()..initialLoad(),
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
      body: BlocBuilder<ListPokemonCubit, ListPokemonState>(
          builder: (context, state) {
        if (state is ListPokemonLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ListPokemonLoadedState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 2,
              crossAxisCount: (MediaQuery.of(context).size.width ~/ 250),
              mainAxisSpacing: 4,
            ),
            itemBuilder: (_, i) {
              if (i >= state.pokemons.length) {
                BlocProvider.of<ListPokemonCubit>(context).requestNextPage();
                return Center(child: CircularProgressIndicator());
              }
              PokemonEntry entry = state.pokemons[i];
              return PokemonListCard(entry);
            },
            itemCount: state.pokemons.length + 1,
          );
        }
        return Container();
      }),
    );
  }
}
