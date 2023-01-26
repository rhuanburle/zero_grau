import 'package:get/get.dart';

import 'base_screen_controller.dart';

class BaseScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseScreenController>(() => BaseScreenController());
  }
}