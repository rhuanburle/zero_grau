import 'package:get/get.dart';
import '../modules/add_product/add_product.dart';
import '../modules/base/base_screen.dart';
import '../modules/base/drawer_menu.dart';
import '../modules/cadastro/profile_page.dart';
import '../modules/cart/cart_page.dart';
import '../modules/login/login_page.dart';
import '../modules/registration/registration_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => BaseScreen(),
    ),
    GetPage(
      name: PagesRoutes.cartRoute,
      page: () => CartPage(),
    ),
    GetPage(
      name: PagesRoutes.drawerMenu,
      page: () => DrawerMenu(),
    ),
    GetPage(
      name: PagesRoutes.profileRoute,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: PagesRoutes.addProducts,
      page: () => AddProducts(),
    ),
    GetPage(
      name: PagesRoutes.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: PagesRoutes.registrationPage,
      page: () => RegistrationPage(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/baseScreen';
  static const String cartRoute = '/cartPage';
  static const String drawerMenu = '/drawerMenu';
  static const String profileRoute = '/profilePage';
  static const String addProducts = '/addProducts';
  static const String loginPage = '/loginPage';
  static const String registrationPage = '/registrationPage';
}
