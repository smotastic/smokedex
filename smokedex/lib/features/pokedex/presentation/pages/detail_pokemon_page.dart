import 'package:flutter/material.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

class DetailPokemonPage extends StatelessWidget {
  static const String route = 'detail-pokemon';

  const DetailPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entry = ModalRoute.of(context)!.settings.arguments as PokemonEntry;
    return Scaffold(
      appBar: AppBar(
        title: Text(entry.name),
      ),
      body: Container(
        child: Hero(
          tag: entry.id,
          child: Image.network(
            entry.imageUrl,
            fit: BoxFit.scaleDown,
            height: 140,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
