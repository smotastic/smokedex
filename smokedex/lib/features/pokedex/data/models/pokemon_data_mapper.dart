import 'package:smartstruct/smartstruct.dart';
import 'package:smokedex/core/data/datasources/local/moor/moor_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

part 'pokemon_data_mapper.mapper.g.dart';

@Mapper()
abstract class PokemonDataMapper {
  static PokemonDataMapper get instance => PokemonDataMapperImpl();

  PokemonModel fromData(PokemonData data, List<PokemonTypeData> types,
      List<PokemonAbilityData> abilities) {
    return PokemonModel(
        data.id,
        data.name,
        data.image,
        data.weight,
        data.baseExperience,
        types.map(PokemonTypeDataMapper.instance.fromData).toList(),
        abilities.map(PokemonAbilityDataMapper.instance.fromData).toList());
  }

  PokemonData fromModel(PokemonModel model) {
    return PokemonData(
        id: model.id.toInt(),
        name: model.name,
        image: model.imageUrl,
        weight: model.weight,
        baseExperience: model.baseExperience);
  }
}

@Mapper()
abstract class PokemonTypeDataMapper {
  static PokemonTypeDataMapper get instance => PokemonTypeDataMapperImpl();

  String fromData(PokemonTypeData data) {
    return data.type;
  }
}

@Mapper()
abstract class PokemonAbilityDataMapper {
  static PokemonAbilityDataMapper get instance =>
      PokemonAbilityDataMapperImpl();

  PokemonAbilityModel fromData(PokemonAbilityData data);
}
