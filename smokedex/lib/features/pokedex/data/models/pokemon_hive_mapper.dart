import 'package:smartstruct/smartstruct.dart';
import 'package:smokedex/core/data/datasources/local/hive/hive_helper.dart';
import 'package:smokedex/features/pokedex/data/models/pokemon_model.dart';

part 'pokemon_hive_mapper.mapper.g.dart';

@Mapper()
abstract class PokemonHiveMapper {
  static PokemonHiveMapper get instance => PokemonHiveMapperImpl();
  HivePokemon fromModel(PokemonModel model);
  HivePokemonHeldItem fromItemModel(PokemonHeldItemModel model);
  HivePokemonStat fromStatModel(PokemonStatModel model);
  HivePokemonAbility fromAbilityModel(PokemonAbilityModel model);

  PokemonModel fromHive(HivePokemon pokemon);
  PokemonHeldItemModel fromHiveHeldItem(HivePokemonHeldItem item);
  PokemonStatModel fromHiveStat(HivePokemonStat stat);
  PokemonAbilityModel fromHiveAbility(HivePokemonAbility ability);
}
