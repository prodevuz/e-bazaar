import 'package:intl/intl.dart';

class Formatter {
  Formatter._();

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat("dd-MMM-yyyy").format(date);
  }

  static String formatCurrency(double amount) => NumberFormat.currency(locale: 'en-US', symbol: '\$').format(amount);

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 13) {
      return "${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 6)} ${phoneNumber.substring(6, 9)} ${phoneNumber.substring(9, 11)}-${phoneNumber.substring(11)}";
    } else if (phoneNumber.length == 10) {
      return "+998 ${phoneNumber.substring(1, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6, 8)} ${phoneNumber.substring(8)}";
    }

    return phoneNumber;
  }
}
