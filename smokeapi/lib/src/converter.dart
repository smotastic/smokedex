import 'package:smokeapi/smokeapi.dart';
import 'package:smokeapi/src/models/basemodel.dart';

abstract class Converter<T extends BaseModel> {
  T fromJson(Map<String, dynamic> json);
}

class PokemonConverter extends Converter<PokemonModel> {
  @override
  PokemonModel fromJson(Map<String, dynamic> json) {
    return PokemonModel.fromJson(json);
  }
}

class ConverterFactory {
  final Map<Type, Converter> _converters =
      Map.unmodifiable({PokemonModel: PokemonConverter()});

  Converter get<T extends BaseModel>() => _converters[T]!;
}
