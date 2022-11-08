import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class UtilServices {
  final storage = const FlutterSecureStorage();

  Future<void> saveLocalData({required String key, required data}) async {
    await storage.write(key: key, value: data);
  }

  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }
}
