// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lat_lng_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLngAdapterAdapter extends TypeAdapter<LatLngAdapter> {
  @override
  final int typeId = 10;

  @override
  LatLngAdapter read(BinaryReader reader) {
    return LatLngAdapter();
  }

  @override
  void write(BinaryWriter writer, LatLngAdapter obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLngAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
