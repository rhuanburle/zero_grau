class ProductsModel {
  String id;
  String name;
  String brand;
  String unit;
  String category;
  bool alcoolic;
  String description;
  String image;
  String price;
  String size;

  ProductsModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.unit,
    required this.category,
    required this.alcoolic,
    required this.description,
    required this.image,
    required this.price,
    required this.size,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      name: json['ItemName'],
      brand: json['brand'],
      unit: json['unit'],
      category: json['category'],
      alcoolic: json['alcoolic'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ItemName': name,
      'brand': brand,
      'unit': unit,
      'category': category,
      'alcoolic': alcoolic,
      'description': description,
      'image': image,
      'price': price,
      'size': size,
    };
  }
}
