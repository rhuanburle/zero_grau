// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      streetAddress: fields[4] as String?,
      city: fields[5] as String?,
      state: fields[6] as String?,
      zipCode: fields[7] as String?,
      token: fields[8] as String?,
      role: fields[9] as String?,
      status: fields[10] as String?,
      createdAt: fields[11] as String?,
      updatedAt: fields[12] as String?,
      deletedAt: fields[13] as String?,
      number: fields[14] as String?,
      complement: fields[15] as String?,
      neighborhood: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.streetAddress)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.state)
      ..writeByte(7)
      ..write(obj.zipCode)
      ..writeByte(8)
      ..write(obj.token)
      ..writeByte(9)
      ..write(obj.role)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.deletedAt)
      ..writeByte(14)
      ..write(obj.number)
      ..writeByte(15)
      ..write(obj.complement)
      ..writeByte(16)
      ..write(obj.neighborhood);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
