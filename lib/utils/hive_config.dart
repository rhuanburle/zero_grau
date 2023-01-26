import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  saveData({required String key, required data}) async {
    final box = await Hive.openBox('myBox');
    if (box.isOpen)
      print("🐝 $key: HIVE SAVE  🐝");
      box.put(key, data);
    }


  getData({required String key}) async {
    final box = await Hive.openBox('myBox');
    return box.get(key);
  }

  deleteData({required String key}) async {
    final box = await Hive.openBox('myBox');
    if (box.isOpen) {
      print("🐝 $key: HIVE DELETE  🐝");
      box.delete(key);
    }
  }

  deleteAllData() async {
    final box = await Hive.openBox('myBox');
    box.deleteFromDisk();
  }

  getAllData() async {
    final box = await Hive.openBox('myBox');
    return box.toMap();
  }
}
