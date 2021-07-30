import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final Config I = Config();

  _ConfigHelper? _config;

  Future<void> init() async {
    await dotenv.load(fileName: ".env");
    Map<String, String> config = {};
    if (!kIsWeb) {
      config.addAll({...Platform.environment});
    }
    config.addAll(dotenv.env);
    _config = _ConfigHelper._(config);
  }

  String? get(String key) {
    return _config!.get(key);
  }
}

class _ConfigHelper {
  final Map<String, String> _config;
  _ConfigHelper._(this._config);

  String? get(String key) {
    return _config[key];
  }
}
