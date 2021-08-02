// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_helper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePokemonAdapter extends TypeAdapter<HivePokemon> {
  @override
  final int typeId = 1;

  @override
  HivePokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePokemon(
      fields[0] as num,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
      fields[4] as int,
      (fields[5] as List).cast<HivePokemonHeldItem>(),
      (fields[6] as List).cast<HivePokemonStat>(),
      (fields[7] as List).cast<String>(),
      (fields[8] as List).cast<HivePokemonAbility>(),
    );
  }

  @override
  void write(BinaryWriter writer, HivePokemon obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.baseExperience)
      ..writeByte(5)
      ..write(obj.heldItems)
      ..writeByte(6)
      ..write(obj.stats)
      ..writeByte(7)
      ..write(obj.types)
      ..writeByte(8)
      ..write(obj.abilities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HivePokemonHeldItemAdapter extends TypeAdapter<HivePokemonHeldItem> {
  @override
  final int typeId = 2;

  @override
  HivePokemonHeldItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePokemonHeldItem(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivePokemonHeldItem obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePokemonHeldItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HivePokemonStatAdapter extends TypeAdapter<HivePokemonStat> {
  @override
  final int typeId = 3;

  @override
  HivePokemonStat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePokemonStat(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HivePokemonStat obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.effort)
      ..writeByte(2)
      ..write(obj.baseStat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePokemonStatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HivePokemonAbilityAdapter extends TypeAdapter<HivePokemonAbility> {
  @override
  final int typeId = 4;

  @override
  HivePokemonAbility read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePokemonAbility(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivePokemonAbility obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.effect)
      ..writeByte(2)
      ..write(obj.shortEffect)
      ..writeByte(3)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePokemonAbilityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
