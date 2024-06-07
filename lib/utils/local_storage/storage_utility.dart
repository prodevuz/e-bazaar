import 'package:get_storage/get_storage.dart'; // Import GetStorage for local storage functionality

class LocalStorage {
  late final GetStorage _storage; // Declare GetStorage instance

  // Singleton instance
  static LocalStorage? _instance;

  LocalStorage._internal(); // Private constructor

  // Factory method to create a singleton instance
  factory LocalStorage.instance() {
    _instance ??= LocalStorage._internal();
    return _instance!;
  }

  // Method to initialize local storage with a specified bucket name
  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = LocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  // Generic method to write data to local storage
  Future<void> writeData<T>(String key, T value) async => await _storage.write(key, value);

  // Generic method to read data from local storage
  T? readData<T>(String key) => _storage.read<T>(key);

  // Generic method to remove data from local storage
  Future<void> removeData(String key) async => await _storage.remove(key);

  // Method to clear all data from local storage
  Future<void> clearAll() async => await _storage.erase();
}
