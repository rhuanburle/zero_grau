class ProductsModel {
  String name;
  String brand;
  String unit;
  String category;
  bool alcoolic;
  String description;
  String image;
  double price;
  String size;
  String id;

  ProductsModel({
    required this.name,
    required this.brand,
    required this.unit,
    required this.category,
    required this.alcoolic,
    required this.description,
    required this.image,
    required this.price,
    required this.size,
    required this.id,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      name: json['ItemName'],
      brand: json['brand'],
      unit: json['unit'],
      category: json['category'],
      alcoolic: json['alcoolic'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      size: json['size'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ItemName': name,
      'brand': brand,
      'unit': unit,
      'category': category,
      'alcoolic': alcoolic,
      'description': description,
      'image': image,
      'price': price,
      'size': size,
      'id': id,
    };
  }
}
