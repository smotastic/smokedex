import 'dart:convert';

import 'package:http/http.dart';
import 'package:smokeapi/src/converter.dart';
import 'package:smokeapi/src/models/basemodel.dart';

abstract class PokeClient {
  PokeClient();

  Future<T> get<T extends BaseModel>(String path);
}

class PokeRemoteClient extends PokeClient {
  final String _url;
  final Client _client;

  factory PokeRemoteClient({String? url, Client? client}) {
    return PokeRemoteClient._(url ?? '', client ?? Client());
  }

  PokeRemoteClient._(this._url, this._client);

  @override
  Future<T> get<T extends BaseModel>(String urlPath) async {
    final response = await _client.get(Uri.https(_url, urlPath));
    final json = jsonDecode(response.body);
    return ConverterFactory().get<T>().fromJson(json) as T;
  }
}
