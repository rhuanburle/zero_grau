import 'package:hive/hive.dart';

import '../models/user_model.dart';

class Register {
  static adapter() {
    return [
    Hive.registerAdapter(UserModelAdapter()),
    ];
  }
}