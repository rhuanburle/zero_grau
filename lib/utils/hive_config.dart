import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  saveData({required String key, required data}) async {
    final box = await Hive.openBox('myBox');
    box.put(key, data);
  }

  getData({required String key}) async {
    final box = await Hive.openBox('myBox');
    return box.get(key);
  }
}
