import 'package:http/http.dart';

abstract class PokeClient {
  PokeClient();
}

class PokeRemoteClient extends PokeClient {
  final String _url;
  final Client _client;

  factory PokeRemoteClient({String? url, Client? client}) {
    return PokeRemoteClient._(url ?? '', client ?? Client());
  }

  PokeRemoteClient._(this._url, this._client);
}
