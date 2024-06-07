import 'dart:async'; // Importing dart:async for asynchronous operations
import 'package:get/get.dart'; // Importing GetX for state management
import 'package:ebazaar/utils/loaders/loaders.dart'; // Importing loaders utility for displaying loading indicators
import 'package:connectivity_plus/connectivity_plus.dart'; // Importing connectivity_plus for checking device connectivity

class NetworkManager extends GetxController {
  // NetworkManager class definition
  static NetworkManager get instance => Get.find(); // Singleton instance of NetworkManager

  final Connectivity _connectivity = Connectivity(); // Connectivity plugin instance

  // StreamController to broadcast connectivity changes
  StreamController<ConnectivityResult> connectionStatusController = StreamController<ConnectivityResult>();

  // Observable list to hold the current connectivity status
  final RxList<ConnectivityResult> results = [ConnectivityResult.none].obs;

  // Constructor
  NetworkManager() {
    // Initialize the controller and listen for changes
    _listenChange(results.first); // Call the _listenChange method with initial connectivity status
  }

  // Method to listen for connectivity changes
  void _listenChange(ConnectivityResult result) {
    _connectivity.onConnectivityChanged.listen((result) async {
      // Listen for connectivity changes
      if (result.first != results.first) {
        // If the connectivity status changes
        results.value = result; // Update the current connectivity status
        isConnected(); // Check if the device is connected to the internet
      }

      connectionStatusController.add(result.first); // Broadcast the updated connectivity status
      _listenChange(result.first); // Listen for further connectivity changes
    });
  }

  // Method to check if the device is connected to the internet
  Future<bool> isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity(); // Check the current connectivity status
    _listenChange(results.first); // Listen for connectivity changes
    if (connectivityResult.first != ConnectivityResult.none) {
      // If the device is connected to the internet
      return true; // Return true
    } else {
      ADLoaders.warningSnackBar(title: "Internet aloqasi yo'q"); // Show a warning snackbar if there's no internet connection
      return false; // Return false
    }
  }

  // Stream to listen for connectivity changes
  Stream<ConnectivityResult> get connectionChange => connectionStatusController.stream;
}
