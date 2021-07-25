import 'package:smokeapi/smokeapi.dart';
import 'package:smokeapi/src/models/pagination.dart';

import 'models/pokemon_ability_resource.dart';

abstract class Converter<T> {
  T fromJson(Map<String, dynamic> json);
}

class PokemonConverter extends Converter<PokemonResource> {
  @override
  PokemonResource fromJson(Map<String, dynamic> json) {
    return PokemonResource.fromJson(json);
  }
}

class PokemonAbilityConverter extends Converter<PokemonAbilityResource> {
  @override
  PokemonAbilityResource fromJson(Map<String, dynamic> json) {
    return PokemonAbilityResource.fromJson(json);
  }
}

class PaginationConverter extends Converter<Pagination> {
  @override
  Pagination fromJson(Map<String, dynamic> json) {
    return Pagination.fromJson(json);
  }
}

class ConverterFactory {
  final Map<Type, Converter> _converters = Map.unmodifiable(
    {
      PokemonResource: PokemonConverter(),
      PokemonAbilityResource: PokemonAbilityConverter(),
      Pagination: PaginationConverter(),
    },
  );

  Converter get<T>() => _converters[T]!;
}
