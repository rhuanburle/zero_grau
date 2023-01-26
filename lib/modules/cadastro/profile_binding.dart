import 'package:get/get.dart';
import 'package:zero_grau/modules/cadastro/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}