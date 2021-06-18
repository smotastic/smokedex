import 'package:flutter/material.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

class PokemonListCard extends StatelessWidget {
  final PokemonEntry entry;

  const PokemonListCard(this.entry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(entry.name),
    );
  }
}
