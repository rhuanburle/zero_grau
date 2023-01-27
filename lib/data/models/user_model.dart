import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? streetAddress;
  @HiveField(5)
  String? city;
  @HiveField(6)
  String? state;
  @HiveField(7)
  String? zipCode;
  @HiveField(8)
  String? token;
  @HiveField(9)
  String? role;
  @HiveField(10)
  String? status;
  @HiveField(11)
  String? createdAt;
  @HiveField(12)
  String? updatedAt;
  @HiveField(13)
  String? deletedAt;
  @HiveField(14)
  String? number;
  @HiveField(15)
  String? complement;
  @HiveField(16)
  String? neighborhood;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
    this.token,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.number,
    this.complement,
    this.neighborhood,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    streetAddress = json['streetAddress'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    token = json['token'];
    role = json['role'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    number = json['number'];
    complement = json['complement'];
    neighborhood = json['neighborhood'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['streetAddress'] = this.streetAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['token'] = this.token;
    data['role'] = this.role;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['neighborhood'] = this.neighborhood;
    return data;
  }
}