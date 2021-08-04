import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smokedex/core/data/config.dart';
import 'package:smokedex/core/presentation/device_segment.dart';
import 'package:smokedex/features/pokemon_detail/presentation/pages/detail_pokemon_page.dart';
import 'package:smokedex/features/pokedex/presentation/pages/pokedex_page.dart';
import 'package:smokedex/logger/logger.dart';
import 'package:smokedex/logger/logger_level.dart';

import 'core/presentation/themes.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.I.init();
  final String dataSourceEnv = fetchDataSourceByDevice();
  await configureDependencies({
    DeviceSegment.currentDevice.name,
    dataSourceEnv,
  });
  Level envLevel = Logger.levelByName[Config.I.get('log.level') ?? 'debug']!;
  Logger.I.level = envLevel;
  Logger.I.i('Hallo Welt!');
  runApp(MyApp());
}

String fetchDataSourceByDevice() {
  String ret = memory.name; // default
  if (DeviceSegment.currentDevice.isMobile()) {
    ret = Config.I.get('LOCAL_DATASOURCE_MOBILE') ?? hive.name;
  } else if (DeviceSegment.currentDevice.isWeb()) {
    ret = Config.I.get('LOCAL_DATASOURCE_WEB') ?? hive.name;
  }
  return ret;
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
