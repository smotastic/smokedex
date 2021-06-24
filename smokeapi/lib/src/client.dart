import 'dart:convert';

import 'package:http/http.dart';
import 'package:smokeapi/src/converter.dart';

abstract class PokeClient {
  Future<T> get<T>(String path, {Map<String, String>? queryParams});
}

class PokeRemoteClient extends PokeClient {
  final String _url;
  final String _apiVersion;
  final Client _client;
  final ConverterFactory _converterFactory;

  factory PokeRemoteClient(
      {String? url,
      String? apiVersion,
      Client? client,
      ConverterFactory? converterFactory}) {
    return PokeRemoteClient._(
      url ?? '',
      apiVersion ?? '',
      client ?? Client(),
      converterFactory ?? ConverterFactory(),
    );
  }

  PokeRemoteClient._(
      this._url, this._apiVersion, this._client, this._converterFactory);

  @override
  Future<T> get<T>(String urlPath, {Map<String, String>? queryParams}) async {
    print('$_url$_apiVersion$urlPath');
    final uri = Uri.https(_url, '$_apiVersion$urlPath', queryParams);
    final response = await _client.get(uri);
    final json = jsonDecode(response.body);
    return _converterFactory.get<T>().fromJson(json) as T;
  }
}
