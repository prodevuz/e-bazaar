class ADFormatException implements Exception {
  final String message;

  ADFormatException([this.message = "Noma'lum format xatoligi."]);

  factory ADFormatException.fromMessage(String message) {
    return ADFormatException(message);
  }

  String get formattedMessage => message;

  factory ADFormatException.fromCode(exception) {
    switch (exception) {
      case 'invalid-email-format':
        return ADFormatException("Maxsus token formati noto'g'ri. Maxsus tokeningizni tekshirib ko'ring");
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
      case 'invalid_password_format':
        return ADFormatException("Parol formati yaroqsiz. Parol kamida 8 ta belgidan iborat bo'lishi kerak.");
      default:
        return ADFormatException("Noma'lum format xatoligi: $exception");
    }
  }
}
