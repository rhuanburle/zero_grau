import 'package:get/get.dart';
import 'package:zero_grau/pages/cart/cart_page.dart';
import '../pages/base/base_screen.dart';
import '../pages/base/drawer_menu.dart';

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
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/baseScreen';
  static const String cartRoute = '/cartPage';
  static const String drawerMenu = '/drawerMenu';
}