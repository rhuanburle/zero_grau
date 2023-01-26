import 'package:get/get.dart';
import 'package:zero_grau/modules/base/base_screen_binding.dart';
import 'package:zero_grau/modules/cart/cart_binding.dart';
import 'package:zero_grau/routes/pages_routes.dart';
import '../modules/add_product/add_product.dart';
import '../modules/add_product/add_product_binding.dart';
import '../modules/base/base_screen.dart';
import '../modules/cadastro/profile_binding.dart';
import '../modules/cadastro/profile_page.dart';
import '../modules/cart/cart_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import '../modules/registration/registration_binding.dart';
import '../modules/registration/registration_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.baseRoute,
      binding: BaseScreenBinding(),
      page: () => BaseScreen(),
    ),
    GetPage(
      name: PagesRoutes.cartRoute,
      binding: CartBinding(),
      page: () => CartPage(),
    ),
    GetPage(
      name: PagesRoutes.profileRoute,
      binding: ProfileBinding(),
      page: () => ProfilePage(),
    ),
    GetPage(
      name: PagesRoutes.addProducts,
      binding: AddProductBinding(),
      page: () => AddProducts(),
    ),
    GetPage(
      name: PagesRoutes.loginPage,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: PagesRoutes.registrationPage,
      binding: RegistrationBinding(),
      page: () => RegistrationPage(),
    ),
  ];
}
