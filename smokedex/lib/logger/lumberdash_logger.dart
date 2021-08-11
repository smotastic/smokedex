import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:smokedex/logger/logger.dart';
import 'package:smokedex/logger/logger_level.dart';
import 'package:lumberdash/lumberdash.dart' as lumber;

class LumberdashLogger extends Logger {
  LumberdashLogger() {
    lumber.putLumberdashToWork(withClients: [ColorizeLumberdash()]);
  }
  @override
  void d(message, [error, StackTrace? stackTrace]) {
    lumber.logMessage(message);
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    lumber.logFatal(message);
    lumber.logError(error);
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    lumber.logMessage(message);
  }

  @override
  set level(Level level) {
    // not provided by lumberdash
  }

  @override
  void v(message, [error, StackTrace? stackTrace]) {
    lumber.logMessage(message);
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    lumber.logWarning(message);
  }

  @override
  void wtf(message, [error, StackTrace? stackTrace]) {
    lumber.logFatal(message);
  }
}
