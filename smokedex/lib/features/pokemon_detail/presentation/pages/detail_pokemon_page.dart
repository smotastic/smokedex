import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:smokedex/features/pokemon_detail/presentation/bloc/detail_pokemon_cubit.dart';

class DetailPokemonPage extends StatelessWidget {
  static const String route = 'detail-pokemon';

  const DetailPokemonPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as num;
    return BlocProvider(
      create: (_) => GetIt.I<DetailPokemonCubit>()..load(id),
      child: PokemonDetailView(),
    );
  }
}

class PokemonDetailView extends StatelessWidget {
  const PokemonDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: BlocBuilder<DetailPokemonCubit, DetailPokemonState>(
        builder: (context, state) {
          if (state is DetailPokemonLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DetailPokemonLoadedState) {
            final pokemon = state.pokemon;
            return Container(
              child: Hero(
                tag: pokemon.id,
                child: Image.network(
                  pokemon.imageUrl,
                  fit: BoxFit.scaleDown,
                  height: 140,
                  width: double.infinity,
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
// @override
  // Widget build(BuildContext context) {
  //   final id = ModalRoute.of(context)!.settings.arguments as num;
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('$id'),
  //     ),
  //     body: Container(
  //       child: Hero(
  //         tag: id,
  //         child: Image.network(
  //           '',
  //           fit: BoxFit.scaleDown,
  //           height: 140,
  //           width: double.infinity,
  //         ),
  //       ),
  //     ),
  //   );
  // }