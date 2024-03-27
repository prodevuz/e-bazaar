class Validator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email bo'lishi shart.";
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return "Noto'g'ri email.";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Parol bo'lishi shart";
    }
    if (value.length < 6) {
      return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Parolda kamida bitta raqam bo'lishi kerak";
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Parolda kamida bitta maxsus belgi bo'lishi kerak";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Telefon raqam bo'lishi shart";
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return "Noto'g'i telefon raqam formati (10 ta raqam)";
    }

    return null;
  }
}
