import 'package:get/get.dart';
import 'package:zero_grau/models/cart_model.dart';
import 'package:zero_grau/models/products_model.dart';

final filterListAlcoholic = [
  'Brahma',
  'Heineken',
  'Stella',
  'Einsenbahn',
  'Vinho',
  'Destilados',
];

final filterListNoAlcoholic = [
  'Refrigerante',
  'Suco',
  'Energético',
  'Água',
];

final filterListOthers = [
  'Gelo',
  'Sal Grosso',
  'Carvão',
  'Churrasqueiras',
];

List sendItens = [
  {
    'name': 'Heineken',
    'price': '6.99',
    'image': 'assets/images/heineken_350.png',
    'description': 'Cerveja Heineken 350ml',
    'category': 'Cerveja',
    'brand': 'Heineken',
    'unit': 'un',
    'size': '350ml',
    'alcoolic': true,
  },
  {
    'name': 'Einsenbahn',
    'price': '5.99',
    'image': 'assets/images/eisenbahn_350.png',
    'description': 'Cerveja Einsenbahn 350ml',
    'category': 'Cerveja',
    'brand': 'Einsenbahn',
    'unit': 'un',
    'size': '350ml',
    'alcoolic': true,
  },
  {
    'name': 'Bohemia',
    'price': '4.99',
    'image': 'assets/images/bohemia_350.jpg',
    'description': 'Cerveja Bohemia 350ml',
    'category': 'Cerveja',
    'brand': 'Bohemia',
    'unit': 'un',
    'size': '350ml',
    'alcoolic': true,
  },
  {
    'name': 'Stella',
    'price': '5.99',
    'image': 'assets/images/stella_350.jpg',
    'description': 'Cerveja Stella 350ml',
    'category': 'Cerveja',
    'brand': 'Stella',
    'unit': 'un',
    'size': '350ml',
    'alcoolic': true,
  },
  {
    'name': 'Aguá mineral Minalba',
    'price': '1,99',
    'image': 'assets/images/minalba_500ml.jpg',
    'description': 'Agua mineral Minalba 500ml',
    'category': 'Agua',
    'brand': 'Minalba',
    'unit': 'un',
    'size': '500ml',
    'alcoolic': false,
  },
  {
    'name': 'Coca-Cola',
    'price': '7,99',
    'image': 'assets/images/cocaCola_2l.jpeg',
    'description': 'Cola-Cola 2L',
    'category': 'Refrigerante',
    'brand': 'Coca-Cola',
    'unit': 'un',
    'size': '2L',
    'alcoolic': false,
  },
  {
    'name': 'Coca-Cola',
    'price': '2.99',
    'image': 'assets/images/cocaCola_350ml.png',
    'description': 'Coca-Cola Lata 350ml',
    'category': 'Refrigerante',
    'brand': 'Coca-Cola',
    'unit': 'un',
    'size': '350ml',
    'alcoolic': false,
  },
  {
    'name': 'RedBull',
    'price': '8.99',
    'image': 'assets/images/redBull_250ml.jpg',
    'description': 'Red Bull 250ml',
    'category': 'Energetico',
    'brand': 'Red Bull',
    'unit': 'un',
    'size': '250ml',
    'alcoolic': false,
  },
  {
    'name': 'Carvão Vegetal',
    'price': '11,99',
    'image': 'assets/images/carvao_6kg.jpeg',
    'description': 'Carvão Vegetal 6kg',
    'category': 'carvao',
    'brand': 'vegetal',
    'unit': 'un',
    'size': '6kg',
    'alcoolic': false,
  },
  {
    'name': 'Gelo em Escama',
    'price': '5,99',
    'image': 'assets/images/gelo_escama.png',
    'description': 'Saco de Gelo em escama 10kg',
    'category': 'Gelo',
    'brand': 'Gelo',
    'unit': 'un',
    'size': '10kg',
    'alcoolic': false,
  },
  {
    'name': 'Gelo em Cubo',
    'price': '5,99',
    'image': 'assets/images/gelo_cubo.png',
    'description': 'Saco de Gelo em cubo 5kg',
    'category': 'Gelo',
    'brand': 'Gelo',
    'unit': 'un',
    'size': '5kg',
    'alcoolic': false,
  },
  {
    'name': 'Sal Grosso',
    'price': '2,00',
    'image': 'assets/images/sal_grosso.png',
    'description': 'Sal Aji-Sal grosso 1kg',
    'category': 'outros',
    'brand': 'agi-sal',
    'unit': 'un',
    'size': '1kg',
    'alcoolic': false,
  }
];
