// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PokemonData extends DataClass implements Insertable<PokemonData> {
  final int id;
  final String name;
  final String image;
  final int weight;
  final int baseExperience;
  PokemonData(
      {required this.id,
      required this.name,
      required this.image,
      required this.weight,
      required this.baseExperience});
  factory PokemonData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      baseExperience: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}base_experience'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['weight'] = Variable<int>(weight);
    map['base_experience'] = Variable<int>(baseExperience);
    return map;
  }

  PokemonCompanion toCompanion(bool nullToAbsent) {
    return PokemonCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      weight: Value(weight),
      baseExperience: Value(baseExperience),
    );
  }

  factory PokemonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PokemonData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      weight: serializer.fromJson<int>(json['weight']),
      baseExperience: serializer.fromJson<int>(json['baseExperience']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'weight': serializer.toJson<int>(weight),
      'baseExperience': serializer.toJson<int>(baseExperience),
    };
  }

  PokemonData copyWith(
          {int? id,
          String? name,
          String? image,
          int? weight,
          int? baseExperience}) =>
      PokemonData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        weight: weight ?? this.weight,
        baseExperience: baseExperience ?? this.baseExperience,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('weight: $weight, ')
          ..write('baseExperience: $baseExperience')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(image.hashCode,
              $mrjc(weight.hashCode, baseExperience.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.weight == this.weight &&
          other.baseExperience == this.baseExperience);
}

class PokemonCompanion extends UpdateCompanion<PokemonData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<int> weight;
  final Value<int> baseExperience;
  const PokemonCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.weight = const Value.absent(),
    this.baseExperience = const Value.absent(),
  });
  PokemonCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    required int weight,
    required int baseExperience,
  })  : name = Value(name),
        image = Value(image),
        weight = Value(weight),
        baseExperience = Value(baseExperience);
  static Insertable<PokemonData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<int>? weight,
    Expression<int>? baseExperience,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (weight != null) 'weight': weight,
      if (baseExperience != null) 'base_experience': baseExperience,
    });
  }

  PokemonCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? image,
      Value<int>? weight,
      Value<int>? baseExperience}) {
    return PokemonCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      weight: weight ?? this.weight,
      baseExperience: baseExperience ?? this.baseExperience,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (baseExperience.present) {
      map['base_experience'] = Variable<int>(baseExperience.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('weight: $weight, ')
          ..write('baseExperience: $baseExperience')
          ..write(')'))
        .toString();
  }
}

class $PokemonTable extends Pokemon with TableInfo<$PokemonTable, PokemonData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PokemonTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _baseExperienceMeta =
      const VerificationMeta('baseExperience');
  late final GeneratedColumn<int?> baseExperience = GeneratedColumn<int?>(
      'base_experience', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, image, weight, baseExperience];
  @override
  String get aliasedName => _alias ?? 'pokemon';
  @override
  String get actualTableName => 'pokemon';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('base_experience')) {
      context.handle(
          _baseExperienceMeta,
          baseExperience.isAcceptableOrUnknown(
              data['base_experience']!, _baseExperienceMeta));
    } else if (isInserting) {
      context.missing(_baseExperienceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PokemonTable createAlias(String alias) {
    return $PokemonTable(_db, alias);
  }
}

class PokemonTypeData extends DataClass implements Insertable<PokemonTypeData> {
  final String type;
  final int pokemonId;
  PokemonTypeData({required this.type, required this.pokemonId});
  factory PokemonTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonTypeData(
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      pokemonId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pokemon_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type'] = Variable<String>(type);
    map['pokemon_id'] = Variable<int>(pokemonId);
    return map;
  }

  PokemonTypeCompanion toCompanion(bool nullToAbsent) {
    return PokemonTypeCompanion(
      type: Value(type),
      pokemonId: Value(pokemonId),
    );
  }

  factory PokemonTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PokemonTypeData(
      type: serializer.fromJson<String>(json['type']),
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<String>(type),
      'pokemonId': serializer.toJson<int>(pokemonId),
    };
  }

  PokemonTypeData copyWith({String? type, int? pokemonId}) => PokemonTypeData(
        type: type ?? this.type,
        pokemonId: pokemonId ?? this.pokemonId,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonTypeData(')
          ..write('type: $type, ')
          ..write('pokemonId: $pokemonId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(type.hashCode, pokemonId.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonTypeData &&
          other.type == this.type &&
          other.pokemonId == this.pokemonId);
}

class PokemonTypeCompanion extends UpdateCompanion<PokemonTypeData> {
  final Value<String> type;
  final Value<int> pokemonId;
  const PokemonTypeCompanion({
    this.type = const Value.absent(),
    this.pokemonId = const Value.absent(),
  });
  PokemonTypeCompanion.insert({
    required String type,
    required int pokemonId,
  })  : type = Value(type),
        pokemonId = Value(pokemonId);
  static Insertable<PokemonTypeData> custom({
    Expression<String>? type,
    Expression<int>? pokemonId,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (pokemonId != null) 'pokemon_id': pokemonId,
    });
  }

  PokemonTypeCompanion copyWith({Value<String>? type, Value<int>? pokemonId}) {
    return PokemonTypeCompanion(
      type: type ?? this.type,
      pokemonId: pokemonId ?? this.pokemonId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonTypeCompanion(')
          ..write('type: $type, ')
          ..write('pokemonId: $pokemonId')
          ..write(')'))
        .toString();
  }
}

class $PokemonTypeTable extends PokemonType
    with TableInfo<$PokemonTypeTable, PokemonTypeData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PokemonTypeTable(this._db, [this._alias]);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _pokemonIdMeta = const VerificationMeta('pokemonId');
  late final GeneratedColumn<int?> pokemonId = GeneratedColumn<int?>(
      'pokemon_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES pokemon (id)');
  @override
  List<GeneratedColumn> get $columns => [type, pokemonId];
  @override
  String get aliasedName => _alias ?? 'pokemon_type';
  @override
  String get actualTableName => 'pokemon_type';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    } else if (isInserting) {
      context.missing(_pokemonIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PokemonTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonTypeData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PokemonTypeTable createAlias(String alias) {
    return $PokemonTypeTable(_db, alias);
  }
}

class PokemonAbilityData extends DataClass
    implements Insertable<PokemonAbilityData> {
  final String name;
  final String effect;
  final String shortEffect;
  final String language;
  final int pokemonId;
  PokemonAbilityData(
      {required this.name,
      required this.effect,
      required this.shortEffect,
      required this.language,
      required this.pokemonId});
  factory PokemonAbilityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonAbilityData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      effect: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}effect'])!,
      shortEffect: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}short_effect'])!,
      language: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}language'])!,
      pokemonId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pokemon_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['effect'] = Variable<String>(effect);
    map['short_effect'] = Variable<String>(shortEffect);
    map['language'] = Variable<String>(language);
    map['pokemon_id'] = Variable<int>(pokemonId);
    return map;
  }

  PokemonAbilityCompanion toCompanion(bool nullToAbsent) {
    return PokemonAbilityCompanion(
      name: Value(name),
      effect: Value(effect),
      shortEffect: Value(shortEffect),
      language: Value(language),
      pokemonId: Value(pokemonId),
    );
  }

  factory PokemonAbilityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PokemonAbilityData(
      name: serializer.fromJson<String>(json['name']),
      effect: serializer.fromJson<String>(json['effect']),
      shortEffect: serializer.fromJson<String>(json['shortEffect']),
      language: serializer.fromJson<String>(json['language']),
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'effect': serializer.toJson<String>(effect),
      'shortEffect': serializer.toJson<String>(shortEffect),
      'language': serializer.toJson<String>(language),
      'pokemonId': serializer.toJson<int>(pokemonId),
    };
  }

  PokemonAbilityData copyWith(
          {String? name,
          String? effect,
          String? shortEffect,
          String? language,
          int? pokemonId}) =>
      PokemonAbilityData(
        name: name ?? this.name,
        effect: effect ?? this.effect,
        shortEffect: shortEffect ?? this.shortEffect,
        language: language ?? this.language,
        pokemonId: pokemonId ?? this.pokemonId,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonAbilityData(')
          ..write('name: $name, ')
          ..write('effect: $effect, ')
          ..write('shortEffect: $shortEffect, ')
          ..write('language: $language, ')
          ..write('pokemonId: $pokemonId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(
          effect.hashCode,
          $mrjc(shortEffect.hashCode,
              $mrjc(language.hashCode, pokemonId.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonAbilityData &&
          other.name == this.name &&
          other.effect == this.effect &&
          other.shortEffect == this.shortEffect &&
          other.language == this.language &&
          other.pokemonId == this.pokemonId);
}

class PokemonAbilityCompanion extends UpdateCompanion<PokemonAbilityData> {
  final Value<String> name;
  final Value<String> effect;
  final Value<String> shortEffect;
  final Value<String> language;
  final Value<int> pokemonId;
  const PokemonAbilityCompanion({
    this.name = const Value.absent(),
    this.effect = const Value.absent(),
    this.shortEffect = const Value.absent(),
    this.language = const Value.absent(),
    this.pokemonId = const Value.absent(),
  });
  PokemonAbilityCompanion.insert({
    required String name,
    required String effect,
    required String shortEffect,
    required String language,
    required int pokemonId,
  })  : name = Value(name),
        effect = Value(effect),
        shortEffect = Value(shortEffect),
        language = Value(language),
        pokemonId = Value(pokemonId);
  static Insertable<PokemonAbilityData> custom({
    Expression<String>? name,
    Expression<String>? effect,
    Expression<String>? shortEffect,
    Expression<String>? language,
    Expression<int>? pokemonId,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (effect != null) 'effect': effect,
      if (shortEffect != null) 'short_effect': shortEffect,
      if (language != null) 'language': language,
      if (pokemonId != null) 'pokemon_id': pokemonId,
    });
  }

  PokemonAbilityCompanion copyWith(
      {Value<String>? name,
      Value<String>? effect,
      Value<String>? shortEffect,
      Value<String>? language,
      Value<int>? pokemonId}) {
    return PokemonAbilityCompanion(
      name: name ?? this.name,
      effect: effect ?? this.effect,
      shortEffect: shortEffect ?? this.shortEffect,
      language: language ?? this.language,
      pokemonId: pokemonId ?? this.pokemonId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (effect.present) {
      map['effect'] = Variable<String>(effect.value);
    }
    if (shortEffect.present) {
      map['short_effect'] = Variable<String>(shortEffect.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonAbilityCompanion(')
          ..write('name: $name, ')
          ..write('effect: $effect, ')
          ..write('shortEffect: $shortEffect, ')
          ..write('language: $language, ')
          ..write('pokemonId: $pokemonId')
          ..write(')'))
        .toString();
  }
}

class $PokemonAbilityTable extends PokemonAbility
    with TableInfo<$PokemonAbilityTable, PokemonAbilityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PokemonAbilityTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _effectMeta = const VerificationMeta('effect');
  late final GeneratedColumn<String?> effect = GeneratedColumn<String?>(
      'effect', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _shortEffectMeta =
      const VerificationMeta('shortEffect');
  late final GeneratedColumn<String?> shortEffect = GeneratedColumn<String?>(
      'short_effect', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  late final GeneratedColumn<String?> language = GeneratedColumn<String?>(
      'language', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _pokemonIdMeta = const VerificationMeta('pokemonId');
  late final GeneratedColumn<int?> pokemonId = GeneratedColumn<int?>(
      'pokemon_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES pokemon (id)');
  @override
  List<GeneratedColumn> get $columns =>
      [name, effect, shortEffect, language, pokemonId];
  @override
  String get aliasedName => _alias ?? 'pokemon_ability';
  @override
  String get actualTableName => 'pokemon_ability';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonAbilityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('effect')) {
      context.handle(_effectMeta,
          effect.isAcceptableOrUnknown(data['effect']!, _effectMeta));
    } else if (isInserting) {
      context.missing(_effectMeta);
    }
    if (data.containsKey('short_effect')) {
      context.handle(
          _shortEffectMeta,
          shortEffect.isAcceptableOrUnknown(
              data['short_effect']!, _shortEffectMeta));
    } else if (isInserting) {
      context.missing(_shortEffectMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    } else if (isInserting) {
      context.missing(_pokemonIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PokemonAbilityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonAbilityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PokemonAbilityTable createAlias(String alias) {
    return $PokemonAbilityTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PokemonTable pokemon = $PokemonTable(this);
  late final $PokemonTypeTable pokemonType = $PokemonTypeTable(this);
  late final $PokemonAbilityTable pokemonAbility = $PokemonAbilityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pokemon, pokemonType, pokemonAbility];
}
