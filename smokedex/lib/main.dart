import 'package:flutter/material.dart';
import 'package:smokedex/core/presentation/device_segment.dart';
import 'package:smokedex/features/pokedex/presentation/pages/detail_pokemon_page.dart';
import 'package:smokedex/features/pokedex/presentation/pages/pokedex_page.dart';

import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies({DeviceSegment.currentDevice().name});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokedexPage(),
      routes: {
        DetailPokemonPage.route: (_) => DetailPokemonPage(),
      },
    );
  }
}
