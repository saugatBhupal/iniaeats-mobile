import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class AppPermissions {
  AppPermissions._();

  static Future<bool> checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isDenied || status.isRestricted) {
      final result = await Permission.camera.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  static Future<bool> checkLocationPermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return false;
    }

    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      return true;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }
}
