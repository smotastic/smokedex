import 'package:smartdata/smartdata.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

import 'pokedex_generator.smart.dart';

@SmartdataInit(forClasses: [
  PokemonModel,
  PokemonAbilityModel,
  PokemonStatModel,
  PokemonHeldItemModel
])
void init() {
  $init();
}
