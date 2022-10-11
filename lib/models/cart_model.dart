import 'package:zero_grau/models/products_model.dart';

class CartModel {
  int id;
  String name;
  double price;
  int quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
