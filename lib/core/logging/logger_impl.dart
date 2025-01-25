import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'logger.dart';

@LazySingleton(as: AppLogger)
class LoggerImpl implements AppLogger {
  final Logger _logger;

  LoggerImpl()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 8,
            lineLength: 80,
            colors: true,
            printEmojis: true,
          ),
        );

  @override
  void debug(String message) {
    _logger.d(message);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }

  @override
  void warning(String message) {
    _logger.w(message);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message);
  }
}
