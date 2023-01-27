import 'package:get/get.dart';
import '../../data/providers/services/auth_service.dart';
import '../../routes/pages_routes.dart';

class DrawerMenuController extends GetxController {
  final authService = Get.find<AuthService>();

  void exitAccount() async {
    try {
      await authService.signOut();
      Get.toNamed(PagesRoutes.loginPage);
    } catch (e) {
      print(e);
    }
  }

}