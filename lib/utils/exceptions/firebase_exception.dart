class ADFirebaseException implements Exception {
  ADFirebaseException(this.code);

  final String code;

  String get message {
    switch (code) {
      case 'unknown':
        return "Noma'lum firebase xatosi. Qayta urinib ko'ring.";
      case 'invalid-custom-token':
        return "Maxsus token formati noto'g'ri. Maxsus tokeningizni tekshirib ko'ring";
      case 'custom-token-mismatch':
        return "Bu maxsus token boshqa auditoriyaga mos keladi.";
      case 'user-disabled':
        return "Bu foydalanuvchi hisobi o'chirilgan. Yordam uchun qo'llab quvvatlash markazi bilan bog'laning.";
      case 'user-not-found':
        return "Noto'g'ri login ma'lumotlari. Hisob topilmadi.";
      case 'invalid-email':
        return "Bu email yaroqsiz. Boshqa email kiriting.";
      case 'email-already-in-use':
        return "Bu email allaqachon mavjud. Boshqa emaildan foydalanib ko'ring.";
      case 'weak-password':
        return "Parol juda kuchsiz. Kuchliroq parol kiriting.";
      case 'wrong-password':
        return "Noto'g'ri parol. Parolingizni tekshirib qayta urinib ko'ring.";
      case 'provider-already-linked':
        return "Hisob allaqachon boshqa provayder orqali ulangan";
      case 'operation-not-allowed':
        return "Bu amalga ruxsat berilmagan. Yordam uchun qo'llab quvvatlash markazi bilan bog'laning";
      case 'invalid-verification-code':
        return "Yaroqsiz tasdiqlash kodi. Yaroqli tasdiqlash kodini kiriting.";
      case 'invalid-verification-id':
        return "Yaroqsiz tasdiqlash identifikatori. Yangi tasdiqlash kodini jo'nating.";
      case 'quota-exceeded':
        return "Urinishlar ko'payib ketdi. Keyinroq qayta urinib ko'ring.";
      case 'requires-recent-login':
        return "Bu amal qayta autentikatsiyadan o'tishni talab qiladi. Hisobingizga qaytadan kiring.";
      case 'credential-already-in-use':
        return "Bu ma'lumotlar boshqa foydalanuvchi hisobiga tegishli.";
      case 'user-mismatch':
        return "Bu ma'lumotlar oldin ro'yxatdan o'tgan foydalanuvchiga mos kelmaydi.";
      case 'account-excists-with-different-credentials':
        return "Ushbu emailga bog'langan hisob allaqachon boshqa ma'lumotlar bilan mavjud.";
      case 'network-request-failed':
        return "Tarmoq so'rovi bajarilmadi. Internet ulanishingizni tekshiring.";
      case 'timeout':
        return "So'rov vaqti tugadi. Keyinroq qayta urinib ko'ring.";
      case 'invalid-api-key':
        return "Yaroqsiz API kaliti.";
      case 'invalid-phone-number':
        return "Yaroqsiz telefon raqami. Telefon raqamingizni tekshirib ko'ring.";
      case 'missing-phone-number':
        return "Telefon raqami kiritilmagan. Telefon raqamingizni kiriting.";
      case 'missing-verification-code':
        return "Tasdiqlash kodi kiritilmagan. Tasdiqlash kodini kiriting.";
      default:
        return "Noma'lum server xatoligi. ";
    }
  }
}
