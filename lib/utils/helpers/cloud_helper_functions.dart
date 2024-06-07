import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// A helper class containing utility functions for managing cloud data and UI states.
class ADCloudHelperFunctions {
  
  /// Checks the state of a single record [snapshot] and returns an appropriate widget.
  /// If the connection is waiting, it shows a [loader] (default is a [CircularProgressIndicator]).
  /// If no data is found or there is an error, it returns a respective message widget.
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot, [Widget loader = const Center(child: CircularProgressIndicator())]) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loader;
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text("Ma'lumot topilmadi!"));
    }
    if (snapshot.hasError) {
      return const Center(child: Text("Nimadir xato ketdi!"));
    }
    return null;
  }

  /// Checks the state of a multiple record [snapshot] and returns an appropriate widget.
  /// If the connection is waiting, it shows a [loader] (default is a [CircularProgressIndicator]).
  /// If no data is found or there is an error, it returns a respective message widget.
  /// Optional parameters [loader], [error], and [nothingFound] allow for custom messages.
  static Widget? checkMultiRecordState<T>({
    required AsyncSnapshot<List<T>> snapshot,
    Widget? loader,
    Widget? error,
    Widget? nothingFound,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loader ?? const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      return nothingFound ?? const Center(child: Text("Ma'lumot topilmadi!"));
    }
    if (snapshot.hasError) {
      return error ?? const Center(child: Text("Nimadir xato ketdi!"));
    }
    return null;
  }

  /// Retrieves a download URL from Firebase Storage using the given [path].
  /// If the [path] is empty, it returns an empty string.
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
