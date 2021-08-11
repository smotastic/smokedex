// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SmartdataGenerator
// **************************************************************************

import 'package:smartdata/smartdata.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

class PokemonModelGenerator extends Generator {
  @override
  PokemonModel generateRandom() {
    final pokemonmodel = PokemonModel(
        Smartdata.I.getSingle<num>(),
        Smartdata.I.getSingle<String>(),
        Smartdata.I.getSingle<String>(),
        Smartdata.I.getSingle<int>(),
        Smartdata.I.getSingle<int>(),
        Smartdata.I.get<String>(10),
        Smartdata.I.get<PokemonAbilityModel>(10),
        Smartdata.I.get<PokemonStatModel>(10),
        Smartdata.I.get<PokemonHeldItemModel>(10));
    return pokemonmodel;
  }
}

class PokemonAbilityModelGenerator extends Generator {
  @override
  PokemonAbilityModel generateRandom() {
    final pokemonabilitymodel = PokemonAbilityModel(
        Smartdata.I.getSingle<String>(),
        Smartdata.I.getSingle<String>(),
        Smartdata.I.getSingle<String>(),
        Smartdata.I.getSingle<String>());
    return pokemonabilitymodel;
  }
}

class PokemonStatModelGenerator extends Generator {
  @override
  PokemonStatModel generateRandom() {
    final pokemonstatmodel = PokemonStatModel(Smartdata.I.getSingle<String>(),
        Smartdata.I.getSingle<int>(), Smartdata.I.getSingle<int>());
    return pokemonstatmodel;
  }
}

class PokemonHeldItemModelGenerator extends Generator {
  @override
  PokemonHeldItemModel generateRandom() {
    final pokemonhelditemmodel =
        PokemonHeldItemModel(Smartdata.I.getSingle<String>());
    return pokemonhelditemmodel;
  }
}

$init() {
  Smartdata.put(PokemonModel, PokemonModelGenerator());
  Smartdata.put(PokemonAbilityModel, PokemonAbilityModelGenerator());
  Smartdata.put(PokemonStatModel, PokemonStatModelGenerator());
  Smartdata.put(PokemonHeldItemModel, PokemonHeldItemModelGenerator());
}
