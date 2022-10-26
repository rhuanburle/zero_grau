import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveConfig extends GetxController {
  final _myBox = Hive.box('myBox');
  List productsListHive = [];

  void writeData(String key, dynamic value) {
    _myBox.put(key, value);
    print(_myBox.get(key));
  }

  readData(String key) {
    _myBox.get(key);
  }

  void deleteData(String key) {
    _myBox.delete(key);
  }
}
