class Validator {
  // Check if the value is empty and return an error message if it is
  static String? validateEmptyText(String? fieldName, String? value) {
    return value == null || value.isEmpty ? "$fieldName yozilishi shart." : null;
  }

  static String? validateEmail(String? value) {
    String? result; // Define a variable to store the validation result
    value == null || value.isEmpty ? result = "Email yozilishi shart." : null; // Check if the value is empty and assign an error message if it is
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Define a regular expression for email validation
    !emailRegExp.hasMatch(value!) ? result = "Noto'g'ri email." : null; // Check if the value matches the email format and assign an error message if it doesn't

    return result; // Return the validation result
  }

  static String? validatePassword(String? value) {
    // Check if the value is empty
    if (value == null || value.isEmpty) {
      return "Parol yozilishi shart"; // Return an error message if it is empty
    }
    // Check if the length of the value is less than 6 characters
    if (value.length < 6) {
      return "Parol kamida 6 ta belgidan iborat bo'lishi kerak"; // Return an error message if it is less than 6 characters
    }
    // Check if the value contains at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Parolda kamida bitta raqam bo'lishi kerak"; // Return an error message if it doesn't contain at least one digit
    }
    // Check if the value contains at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Parolda kamida bitta maxsus belgi bo'lishi kerak"; // Return an error message if it doesn't contain at least one special character
    }

    return null; // Return null if the value passes all validations
  }

  static String? validatePhoneNumber(String? value) {
    // Check if the value is empty
    if (value == null || value.isEmpty) {
      return "Telefon raqam yozilishi shart"; // Return an error message if it is empty
    }

    final phoneRegExp = RegExp(r'^\d{9}$'); // Define a regular expression for phone number validation

    // Check if the value matches the phone number format
    if (!phoneRegExp.hasMatch(value)) {
      return "Noto'g'i telefon raqam formati (9 ta raqam)"; // Return an error message if it doesn't match the format
    }

    return null; // Return null if the value passes all validations
  }
}
