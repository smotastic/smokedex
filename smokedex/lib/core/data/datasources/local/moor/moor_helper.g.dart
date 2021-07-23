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
  PokemonData({required this.id, required this.name, required this.image});
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
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    return map;
  }

  PokemonCompanion toCompanion(bool nullToAbsent) {
    return PokemonCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
    );
  }

  factory PokemonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PokemonData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
    };
  }

  PokemonData copyWith({int? id, String? name, String? image}) => PokemonData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, image.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image);
}

class PokemonCompanion extends UpdateCompanion<PokemonData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  const PokemonCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
  });
  PokemonCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
  })  : name = Value(name),
        image = Value(image);
  static Insertable<PokemonData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
    });
  }

  PokemonCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? image}) {
    return PokemonCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
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
  @override
  List<GeneratedColumn> get $columns => [id, name, image];
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

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PokemonTable pokemon = $PokemonTable(this);
  late final $PokemonTypeTable pokemonType = $PokemonTypeTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pokemon, pokemonType];
}
