import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
      // } on FirebaseAuthException catch (e) {
      //   throw ADFirebaseAuthException(e.code).message;
      // } on FirebaseException catch (e) {
      //   throw ADFirebaseException(e.code).message;
      // } on FormatException catch (_) {
      //   throw ADFormatException();
      // } on PlatformException catch (e) {
      //   throw ADPlatformException(e.code).message;
    } catch (e) {
      throw "Nimadir xato ketdi. Iltimos qayta urunib ko'ring";
    }
  }
}
