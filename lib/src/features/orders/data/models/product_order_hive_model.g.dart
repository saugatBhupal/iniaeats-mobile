// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductOrderHiveModelAdapter extends TypeAdapter<ProductOrderHiveModel> {
  @override
  final int typeId = 2;

  @override
  ProductOrderHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductOrderHiveModel(
      cart: (fields[0] as List).cast<CartHiveModel>(),
      totalPrice: fields[1] as int,
      address: fields[2] as String,
      timing: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductOrderHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cart)
      ..writeByte(1)
      ..write(obj.totalPrice)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.timing);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductOrderHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
