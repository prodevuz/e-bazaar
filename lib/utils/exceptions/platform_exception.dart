class ADPlatformException implements Exception {
  ADPlatformException(this.code);

  final String code;

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return "Login ma'lumotlari yaroqsiz. Ma'lumotlaringizni qayta tekshirib ko'ring.";
      case 'too-many-requests':
        return "Juda ko'p so'rovlar. Keyinroq urinib ko'ring.";
      case 'invalid-argument':
        return "Autentifikatsiya metodi uchun yaroqsiz argument ishlatildi.";
      case 'invalid-password':
        return "Noto'g'ri parol. Qayta urinib ko'ring.";
      case 'invalid-phone-number':
        return "Telefon raqam yaroqsiz.";
      case 'network_error':
        return "Tarmoq xatosi. Internet ulanishingizni tekshiring.";
      case 'timeout':
        return "So'rov vaqti tugadi. Keyinroq qayta urinib ko'ring.";
      case 'missing_required_permission':
        return "Kerakli ruxsat yo'q.";
      case 'feature_not_available':
        return "Bu funksiya hozircha mavjud emas.";
      case 'internal_error':
        return "Ichki xatolik yuz berdi.";
      case 'unknown_error':
        return "Noma'lum platforma xatoligi. Qayta urinib ko'ring";
      default:
        return "Noma'lum platforma xatoligi. Qayta urinib ko'ring.";
    }
  }
}
