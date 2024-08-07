/// A custom exception class to handle Firebase Authentication errors.
class ADFirebaseAuthException implements Exception {
  ADFirebaseAuthException(this.code);

  /// The error code from Firebase Authentication.
  final String code;

  /// A human-readable error message based on the Firebase error code.
  String get message {
    switch (code) {
      case 'user-not-found':
        return "Noto'g'ri login ma'lumotlari. Hisob topilmadi.";
      case 'invalid-credential':
        return "Noto'g'ri ma'lumotlar.";
      case 'email-already-in-use':
        return "Ushbu email allaqachon ro'yxatdan o'tkazilgan.";
      case 'invalid-email':
        return "Bu email yaroqsiz. Boshqa email kiriting.";
      case 'weak-password':
        return "Parol juda kuchsiz. Kuchliroq parol kiriting.";
      case 'user-disabled':
        return "Bu foydalanuvchi hisobi o'chirilgan. Yordam uchun qo'llab quvvatlash markazi bilan bog'laning.";
      case 'wrong-password':
        return "Noto'g'ri parol. Parolingizni tekshirib qayta urinib ko'ring.";
      case 'too-many-requests':
        return "So'rovlar juda ko'p. Keyinroq qayta urinib ko'ring.";
      case 'invalid-verification-code':
        return "Yaroqsiz tasdiqlash kodi. Yaroqli tasdiqlash kodini kiriting.";
      case 'invalid-verification-id':
        return "Yaroqsiz tasdiqlash identifikatori. Yangi tasdiqlash kodini jo'nating.";
      case 'quota-exceeded':
        return "Urinishlar ko'payib ketdi. Keyinroq qayta urinib ko'ring.";
      case 'email-already-exists':
        return "Bu email allaqachon mavjud. Boshqa emaildan foydalanib ko'ring.";
      case 'provider-already-linked':
        return "Hisob allaqachon boshqa provayder orqali ulangan.";
      case 'requires-recent-login':
        return "Bu amal qayta autentikatsiyadan o'tishni talab qiladi. Hisobingizga qaytadan kiring.";
      case 'credential-already-in-use':
        return "Bu ma'lumotlar boshqa foydalanuvchi hisobiga tegishli.";
      case 'user-mismatch':
        return "Bu ma'lumotlar oldin ro'yxatdan o'tgan foydalanuvchiga mos kelmaydi.";
      case 'account-exists-with-different-credentials':
        return "Ushbu emailga bog'langan hisob allaqachon boshqa ma'lumotlar bilan mavjud.";
      case 'operation-not-allowed':
        return "Bu amalga ruxsat berilmagan. Yordam uchun qo'llab quvvatlash markazi bilan bog'laning.";
      case 'expired-action-code':
        return "Bu kodning muddati tugagan.";
      case 'invalid-phone-number':
        return "Yaroqsiz telefon raqam.";
      case 'network-request-failed':
        return "Tarmoq so'rovi xatosi.";
      case 'no-auth-provider':
        return "Autentifikatsiya provayderi yo'q.";
      case 'session-expired':
        return "Bu sessiya tugadi.";
      case 'unauthorized-continue-uri':
        return "Davom etish havolasi autentifikatsiyalanmagan.";
      case 'user-token-expired':
        return "Bu tokenning muddati tugagan.";
      default:
        return "Noma'lum autentifikatsiya xatoligi.";
    }
  }
}
