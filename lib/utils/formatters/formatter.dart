import 'package:intl/intl.dart';

/// A utility class for formatting dates, currency, and phone numbers.
class Formatter {
  /// Private constructor to prevent instantiation.
  Formatter._();

  /// Formats the given [date] to a string in the format 'dd-MMM-yyyy'.
  /// If [date] is null, it uses the current date.
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat("dd-MMM-yyyy").format(date);
  }

  /// Formats the given [amount] to a currency string with the US locale and dollar symbol.
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en-US', symbol: '\$').format(amount);
  }

  /// Formats the given [phoneNumber] to a human-readable string.
  /// Supports 13-digit and 10-digit phone numbers.
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 13) {
      return "${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 6)} ${phoneNumber.substring(6, 9)} ${phoneNumber.substring(9, 11)}-${phoneNumber.substring(11)}";
    } else if (phoneNumber.length == 10) {
      return "+998 ${phoneNumber.substring(1, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6, 8)} ${phoneNumber.substring(8)}";
    }
    return phoneNumber;
  }
}
