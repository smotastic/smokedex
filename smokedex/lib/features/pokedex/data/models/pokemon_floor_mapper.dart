import 'package:smartstruct/smartstruct.dart';
import 'package:smokedex/core/data/datasources/local/floor/floor_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

part 'pokemon_floor_mapper.mapper.g.dart';

@Mapper()
abstract class PokemonFloorMapper {
  static PokemonFloorMapper get instance => PokemonFloorMapperImpl();

  PokemonModel fromPokemonFloor(PokemonFloor floor) {
    final pokemonmodel = PokemonModel(floor.id, floor.name, floor.imageUrl,
        floor.weight, floor.baseExperience, [], [], [], []);
    return pokemonmodel;
  }
}
