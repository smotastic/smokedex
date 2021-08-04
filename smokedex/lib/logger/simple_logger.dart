import 'package:logger/logger.dart' as simplelog;
import 'package:smokedex/logger/logger.dart';
import 'package:smokedex/logger/logger_level.dart';

class SimpleLogger extends Logger {
  late final simplelog.Logger logger;

  SimpleLogger() {
    this.logger = simplelog.Logger(
      printer: simplelog.PrettyPrinter(
          methodCount: 0, // number of method calls to be displayed
          errorMethodCount:
              8, // number of method calls if stacktrace is provided
          lineLength: 120, // width of the output
          colors: true, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: true // Should each log print contain a timestamp
          ),
    );
  }

  @override
  void d(message, [error, StackTrace? stackTrace]) {
    logger.d(message, error, stackTrace);
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    logger.e(message, error, stackTrace);
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  @override
  void v(message, [error, StackTrace? stackTrace]) {
    logger.v(message, error, stackTrace);
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    logger.w(message, error, stackTrace);
  }

  @override
  void wtf(message, [error, StackTrace? stackTrace]) {
    logger.wtf(message, error, stackTrace);
  }

  @override
  set level(Level level) {
    simplelog.Logger.level = levelMap[level]!;
  }

  static Map<Level, simplelog.Level> levelMap = {
    Level.verbose: simplelog.Level.verbose,
    Level.info: simplelog.Level.info,
    Level.debug: simplelog.Level.debug,
    Level.warning: simplelog.Level.warning,
    Level.error: simplelog.Level.error,
    Level.wtf: simplelog.Level.wtf,
    Level.nothing: simplelog.Level.nothing,
  };
}
