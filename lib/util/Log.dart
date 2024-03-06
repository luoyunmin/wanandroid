import 'package:logger/logger.dart';

class Log {
  static Logger logger = Logger(
    printer: PrefixPrinter(PrettyPrinter()),
  );

  static void e(String message) {
    logger.e(message);
  }

  static void d(String message) {
    logger.d(message);
  }

  static void i(String message) {
    logger.i(message);
  }

  static void w(String message) {
    logger.w(message);
  }
}
