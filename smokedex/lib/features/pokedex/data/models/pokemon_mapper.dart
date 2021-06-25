import 'package:smartstruct/smartstruct.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

// part 'pokemon_mapper.g.dart';

// @Mapper()
abstract class PokemonMapper {
  // static PokemonMapper get instance => PokemonMapperImpl();
  PokemonEntry fromModel(PokemonModel model);
}
