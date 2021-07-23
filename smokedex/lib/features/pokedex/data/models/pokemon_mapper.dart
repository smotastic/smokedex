import 'package:smartstruct/smartstruct.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/features/pokedex/data/models/poke_model.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

part 'pokemon_mapper.mapper.g.dart';

@Mapper()
abstract class PokemonMapper {
  static PokemonMapper get instance => PokemonMapperImpl();

  PokemonModel fromModel(PokemonResource model) {
    return PokemonModel(
      model.id,
      model.name,
      model.sprites.other?.officialArtwork?.frontDefault ??
          model.sprites.frontDefault!,
      model.types.map((e) => e.type.name).toList(),
    );
  }
}

@Mapper()
abstract class PokemonEntryMapper {
  static PokemonEntryMapper get instance => PokemonEntryMapperImpl();

  PokemonEntry fromModel(PokemonModel model);
}
