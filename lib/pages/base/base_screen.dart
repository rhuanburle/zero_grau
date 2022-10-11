import 'package:flutter/material.dart';
import 'package:zero_grau/pages/alcoholic/alcoholic_page.dart';
import 'package:zero_grau/pages/common_widgets/user_info.dart';
import 'package:zero_grau/models/app_data/app_data.dart';

import '../noAlcoholic/no_alcoholic_page.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Carrinho'),
        icon: Icon(Icons.add_shopping_cart_outlined),
      ),
      // const Icon(Icons.add_shopping_cart_outlined),
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Zero Grau'),
        actions: [
          IconButton(
            onPressed: () {},
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
          Center(child: Text('Profile')),
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
