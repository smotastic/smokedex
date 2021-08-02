import 'package:hive_flutter/hive_flutter.dart';

part 'hive_helper.g.dart';

class HiveHelper {
  HiveHelper._();
  static final I = HiveHelper._();

  HiveInterface? _db;

  Future<HiveInterface> get database async {
    return _db ?? await constructDb();
  }

  Future<HiveInterface> constructDb() async {
    await Hive.initFlutter();
    _db = Hive;
    _db!.registerAdapter(HivePokemonAdapter());
    _db!.registerAdapter(HivePokemonHeldItemAdapter());
    _db!.registerAdapter(HivePokemonStatAdapter());
    _db!.registerAdapter(HivePokemonAbilityAdapter());
    return _db!;
  }
}

@HiveType(typeId: 1)
class HivePokemon {
  @HiveField(0)
  final num id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final int weight;
  @HiveField(4)
  final int baseExperience;
  @HiveField(5)
  final List<HivePokemonHeldItem> heldItems;
  @HiveField(6)
  final List<HivePokemonStat> stats;
  @HiveField(7)
  final List<String> types;
  @HiveField(8)
  final List<HivePokemonAbility> abilities;

  HivePokemon(
      this.id,
      this.name,
      this.imageUrl,
      this.weight,
      this.baseExperience,
      this.heldItems,
      this.stats,
      this.types,
      this.abilities);
}

@HiveType(typeId: 2)
class HivePokemonHeldItem {
  @HiveField(0)
  final String name;

  HivePokemonHeldItem(this.name);
}

@HiveType(typeId: 3)
class HivePokemonStat {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int effort;
  @HiveField(2)
  final int baseStat;

  HivePokemonStat(this.name, this.effort, this.baseStat);
}

@HiveType(typeId: 4)
class HivePokemonAbility {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String effect;
  @HiveField(2)
  final String shortEffect;
  @HiveField(3)
  final String language;

  HivePokemonAbility(this.name, this.effect, this.shortEffect, this.language);
}
