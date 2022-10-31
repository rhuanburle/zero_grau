import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/constants/constants.dart';
import 'package:zero_grau/pages/pages_navigation_bottom/common_widgets_navigation_page/list_products_widget.dart';
import 'package:zero_grau/pages_routes/app_pages.dart';
import 'package:zero_grau/read_firebase/read_firebase.dart';
import '../pages_navigation_bottom/alcoholic/alcoholic_controller.dart';
import '../pages_navigation_bottom/alcoholic/alcoholic_page.dart';
import '../pages_navigation_bottom/noAlcoholic/no_alcoholic_page.dart';
import '../pages_navigation_bottom/others/others_page.dart';
import 'base_creen_controller.dart';
import 'components/alert_dialog_cart.dart';
import 'drawer_menu.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();
  var readProducts = ReadFirebase();
  final ctrl = BaseScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ctrl.showDialogCart(context);
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
          AlcoholicPage(),
          NoAlcoholicPage(),
          OthersPage(),
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
