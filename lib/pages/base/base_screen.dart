import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/pages_routes/app_pages.dart';
import '../pages_navigation_bottom/base_pages.dart';
import '../pages_navigation_bottom/common_widgets_navigation_page/list_products_controller.dart';
import 'base_creen_controller.dart';
import 'drawer_menu.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();
  final ctrl = BaseScreenController();
  final listProductsCtrl = Get.put(ListProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          listProductsCtrl.cartList.isEmpty
              ? Get.snackbar(
                  'Carrinho vazio', 'Adicione um produto ao carrinho',
                  snackPosition: SnackPosition.BOTTOM)
              : ctrl.showDialogCart(context);
          ;
        },
        label: Text('Carrinho'),
        icon: Icon(Icons.add_shopping_cart_outlined),
      ),
      appBar: AppBar(
        title: const Text('Zero Grau'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(PagesRoutes.cartRoute);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          BasePages(type: 'Alcoholic'),
          BasePages(type: 'noAlcoholic'),
          BasePages(type: 'others'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/app_icons/beer_icon.png',
              width: 25,
              height: 25,
              color: currentIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Com álcool',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/app_icons/water_icon.png',
              width: 25,
              height: 25,
              color: currentIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Sem álcool',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/app_icons/grill_icon.png',
              width: 25,
              height: 25,
              color: currentIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Outros',
          ),
        ],
      ),
    );
  }
}
