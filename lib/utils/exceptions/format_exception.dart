/// A custom exception class to handle format-related errors.
class ADFormatException implements Exception {
  /// The error message describing the format error.
  final String message;

  /// Creates an instance of [ADFormatException] with an optional custom error message.
  /// If no message is provided, a default message is used.
  ADFormatException([this.message = "Noma'lum format xatoligi."]);

  /// Factory constructor to create an instance from a custom message.
  factory ADFormatException.fromMessage(String message) {
    return ADFormatException(message);
  }

  /// Returns the formatted error message.
  String get formattedMessage => message;

  /// Factory constructor to create an instance from a specific error code.
  /// Maps error codes to specific error messages.
  factory ADFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return ADFormatException("Email formati noto'g'ri. Emailingizni tekshirib ko'ring.");
      case 'invalid-phone-number-format':
        return ADFormatException("Telefon raqam formati yaroqsiz. Yaroqli telefon raqam kiriting.");
      case 'invalid-date-format':
        return ADFormatException("Sana formati yaroqsiz. Sanani yaroqli formatda kiriting.");
      case 'invalid-url-format':
        return ADFormatException("Havola formati yaroqsiz. Yaroqli havola kiriting.");
      case 'invalid-credit-card-format':
        return ADFormatException("Kredit karta formati yaroqsiz. Yaroqli kredit karta raqamini kiriting.");
      case 'invalid-numeric-format':
        return ADFormatException("Yaroqli raqam formati kiritilishi kerak.");
      case 'invalid-password-format':
        return ADFormatException("Parol formati yaroqsiz. Parol kamida 8 ta belgidan iborat bo'lishi kerak.");
      default:
        return ADFormatException("Noma'lum format xatoligi: $code");
    }
  }
}
