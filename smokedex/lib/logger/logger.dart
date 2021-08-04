import 'package:smokedex/logger/simple_logger.dart';

import 'logger_level.dart';

abstract class Logger {
  static Logger get I => SimpleLogger();
  static Map<String, Level> levelByName = {
    for (var l in Level.values) l.name: l
  };

  /// Sets the [Level] for this logger
  void set level(Level level);

  /// Log a message at level [Level.verbose].
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// Log a message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// Log a message at level [Level.wtf].
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]);
}
