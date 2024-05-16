import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ADCloudHelperFunctions {
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot, [Widget loader = const Center(child: CircularProgressIndicator())]) {
    if (snapshot.connectionState == ConnectionState.waiting) return loader;

    if (!snapshot.hasData || snapshot.data == null) return const Center(child: Text("Ma'lumot topilmadi!"));

    if (snapshot.hasError) return const Center(child: Text("Nimadir xato ketdi!"));

    return null;
  }

  static Widget? checkMultiRecordState<T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) return loader ?? const Center(child: CircularProgressIndicator());

    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) return nothingFound ?? const Center(child: Text("Ma'lumot topilmadi!"));

    if (snapshot.hasError) return error ?? const Center(child: Text("Nimadir xato ketdi!"));

    return null;
  }

  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
