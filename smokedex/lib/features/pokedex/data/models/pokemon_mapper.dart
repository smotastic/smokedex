import 'package:smartstruct/smartstruct.dart';
import 'package:smokeapi/smokeapi.dart';
import 'package:smokedex/core/data/datasources/local/moor/moor_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

part 'pokemon_mapper.mapper.g.dart';

@Mapper()
abstract class PokemonMapper {
  static PokemonMapper get instance => PokemonMapperImpl();

  PokemonModel fromResource(
      PokemonResource model, List<PokemonAbilityResource> abilities) {
    // TODO use Abilities
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

@Mapper()
abstract class PokemonDataMapper {
  static PokemonDataMapper get instance => PokemonDataMapperImpl();

  PokemonModel fromData(PokemonData data, List<String> types) {
    return PokemonModel(data.id, data.name, data.image, types);
  }

  PokemonData fromModel(PokemonModel model) {
    return PokemonData(
        id: model.id.toInt(), name: model.name, image: model.imageUrl);
  }
}
