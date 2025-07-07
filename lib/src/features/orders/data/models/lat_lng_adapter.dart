import 'package:hive/hive.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'lat_lng_adapter.g.dart';

@HiveType(typeId: 10) // pick a unique typeId not used by other adapters
class LatLngAdapter extends TypeAdapter<LatLng> {
  @override
  final int typeId = 10;

  @override
  LatLng read(BinaryReader reader) {
    final latitude = reader.readDouble();
    final longitude = reader.readDouble();
    return LatLng(latitude, longitude);
  }

  @override
  void write(BinaryWriter writer, LatLng obj) {
    writer.writeDouble(obj.latitude);
    writer.writeDouble(obj.longitude);
  }
}
