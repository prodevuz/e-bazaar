import 'package:logger/logger.dart'; // Import the logger package

class LoggerHelper {
  static final Logger _logger = Logger(printer: PrettyPrinter(), level: Level.debug); // Create a Logger instance

  // Method to log debug messages
  static void debug(String message) => _logger.d(message);

  // Method to log info messages
  static void info(String message) => _logger.i(message);

  // Method to log warning messages
  static void warning(String message) => _logger.w(message);

  // Method to log error messages along with optional error and stack trace
  static void error(String message, [dynamic error]) => _logger.e(message, error: error, stackTrace: StackTrace.current);
}
