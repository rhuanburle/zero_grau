import 'package:get/get.dart';
import 'package:zero_grau/models/products_model.dart';

class CartModel {
  String id;
  String name;
  double price;
  RxInt quantity;
  double totalPrice;

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }
}
