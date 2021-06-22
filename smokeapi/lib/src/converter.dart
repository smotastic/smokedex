import 'package:smokeapi/smokeapi.dart';
import 'package:smokeapi/src/models/pagination.dart';

abstract class Converter<T> {
  T fromJson(Map<String, dynamic> json);
}

class PokemonConverter extends Converter<PokemonModel> {
  @override
  PokemonModel fromJson(Map<String, dynamic> json) {
    return PokemonModel.fromJson(json);
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
      PokemonModel: PokemonConverter(),
      Pagination: PaginationConverter(),
    },
  );

  Converter get<T>() => _converters[T]!;
}
