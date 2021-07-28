import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smokedex/core/data/config.dart';
import 'package:smokedex/core/presentation/device_segment.dart';
import 'package:smokedex/features/pokemon_detail/presentation/pages/detail_pokemon_page.dart';
import 'package:smokedex/features/pokedex/presentation/pages/pokedex_page.dart';

import 'core/presentation/themes.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Config.I.init();
  await configureDependencies({DeviceSegment.currentDevice().name});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: AppTheme.fromType(ThemeType.Pokemon_Dark).themeData,
      home: PokedexPage(),
      routes: {
        DetailPokemonPage.route: (_) => DetailPokemonPage(),
      },
    );
  }
}
