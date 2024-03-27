import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final RxList<ConnectivityResult> _connectionStatus = [ConnectivityResult.none].obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) async {
    _connectionStatus.value = results;
    !results.contains(ConnectivityResult.wifi) || !results.contains(ConnectivityResult.mobile) ? ADLoaders.warningSnackBar(title: "Internet aloqasi yo'q") : null;
  }

  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');

      // If the lookup succeeds, there's likely a connection
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
