import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inaeats/src/core/utils/lat_long_utils.dart';
import 'package:location/location.dart';

class ChooseLocationMap extends StatefulWidget {
  final Function(String address, LatLng latLng) onLocationSelected;

  const ChooseLocationMap({super.key, required this.onLocationSelected});

  @override
  State<ChooseLocationMap> createState() => _ChooseLocationMapState();
}

class _ChooseLocationMapState extends State<ChooseLocationMap> {
  LatLng? _currentPosition;
  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  Map<PolylineId, Polyline> polylines = {};
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _getLocationUpdates();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  Future<void> _getLocationUpdates() async {
    bool _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) return;
    }

    PermissionStatus _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    _locationSubscription = _locationController.onLocationChanged.listen((
      LocationData currentLocation,
    ) async {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        LatLng newPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        setState(() {
          _currentPosition = newPosition;
        });

        await _cameraToPosition(newPosition);
        print(newPosition);
        final address = await getAddressFromLatLng(newPosition);
        widget.onLocationSelected(address, newPosition);
      }
    });
  }

  // Future<String> _getAddressFromLatLng(LatLng position) async {
  //   final apiKey = dotenv.env['GOOGLE_MAP_API'];
  //   final url =
  //       'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey';

  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final jsonBody = json.decode(response.body);
  //     if (jsonBody['status'] == 'OK') {
  //       final results = jsonBody['results'] as List;
  //       if (results.isNotEmpty) {
  //         return results[0]['formatted_address'];
  //       }
  //     }
  //   }
  //   return "Unknown location";
  // }

  Future<void> _cameraToPosition(LatLng position) async {
    final controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: position, zoom: 13)),
    );
  }

  void _handleMapTap(LatLng tappedPoint) async {
    setState(() {
      _currentPosition = tappedPoint;
    });
    final address = await getAddressFromLatLng(tappedPoint);
    print("Selected Address: $address");
    widget.onLocationSelected(address, tappedPoint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _currentPosition == null
              ? Center(child: Text("Fetching Location"))
              : GoogleMap(
                onTap: _handleMapTap,
                onMapCreated: (GoogleMapController controller) {
                  if (!_mapController.isCompleted) {
                    _mapController.complete(controller);
                  }
                },
                initialCameraPosition: CameraPosition(target: _currentPosition!, zoom: 13),
                polylines: Set<Polyline>.of(polylines.values),
                markers: {
                  Marker(
                    markerId: MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentPosition!,
                  ),
                },
              ),
    );
  }
}
