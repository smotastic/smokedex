import 'package:moor/moor.dart';
import 'package:smartstruct/smartstruct.dart';
import 'package:smokedex/core/data/datasources/local/moor/moor_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

part 'pokemon_data_mapper.mapper.g.dart';

@Mapper()
abstract class PokemonDataMapper {
  static PokemonDataMapper get instance => PokemonDataMapperImpl();

  PokemonModel fromData(
      PokemonData data,
      List<PokemonTypeData> types,
      List<PokemonAbilityData> abilities,
      List<JoinedPokemonStat> joinedStats,
      List<ItemData> items) {
    return PokemonModel(
      data.id,
      data.name,
      data.image,
      data.weight,
      data.baseExperience,
      types.map(PokemonTypeDataMapper.instance.fromData).toList(),
      abilities.map(PokemonAbilityDataMapper.instance.fromData).toList(),
      joinedStats
          .map((e) => JoinedPokemonStatMapper.instance
              .fromJoinedData(e.stat, e.pokemonStat))
          .toList(),
      items.map(ItemDataMapper.instance.fromData).toList(),
    );
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

  PokemonTypeData fromModel(String type, int pokemonId) {
    return PokemonTypeData(type: type, pokemonId: pokemonId);
  }
}

@Mapper()
abstract class PokemonAbilityDataMapper {
  static PokemonAbilityDataMapper get instance =>
      PokemonAbilityDataMapperImpl();

  PokemonAbilityModel fromData(PokemonAbilityData data);

  PokemonAbilityData fromModel(PokemonAbilityModel model, int pokemonId) {
    return PokemonAbilityData(
        name: model.name,
        effect: model.effect,
        shortEffect: model.shortEffect,
        language: model.language,
        pokemonId: pokemonId);
  }
}

@Mapper()
abstract class ItemDataMapper {
  static ItemDataMapper get instance => ItemDataMapperImpl();

  PokemonHeldItemModel fromData(ItemData data);
  ItemCompanion fromModel(PokemonHeldItemModel model) {
    return ItemCompanion(name: Value(model.name));
  }
}

@Mapper()
abstract class PokemonItemDataMapper {
  static PokemonItemDataMapper get instance => PokemonItemDataMapperImpl();

  PokemonItemData forMapping(int pokemonId, int itemId) {
    return PokemonItemData(pokemonId: pokemonId, itemId: itemId);
  }
}

@Mapper()
abstract class StatDataMapper {
  static StatDataMapper get instance => StatDataMapperImpl();

  StatCompanion fromModel(PokemonStatModel model) {
    return StatCompanion(name: Value(model.name));
  }
}

@Mapper()
abstract class PokemonStatDataMapper {
  static PokemonStatDataMapper get instance => PokemonStatDataMapperImpl();

  PokemonStatData fromModel(PokemonStatModel model, int pokemonId, int statId) {
    return PokemonStatData(
        baseStat: model.baseStat,
        effort: model.effort,
        pokemonId: pokemonId,
        statId: statId);
  }
}

@Mapper()
abstract class JoinedPokemonStatMapper {
  static JoinedPokemonStatMapper get instance => JoinedPokemonStatMapperImpl();

  PokemonStatModel fromJoinedData(StatData stat, PokemonStatData pokemonStat) {
    return PokemonStatModel(
        stat.name, pokemonStat.effort, pokemonStat.baseStat);
  }
}
