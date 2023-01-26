import 'package:get/get.dart';

import 'base_pages_controller.dart';

class BasePagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasePagesController>(() => BasePagesController());
  }
}