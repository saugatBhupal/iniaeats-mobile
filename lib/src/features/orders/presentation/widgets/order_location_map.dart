import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:location/location.dart';

class OrderLocationMap extends StatefulWidget {
  final LatLng? destination;
  const OrderLocationMap({super.key, required this.destination});

  @override
  State<OrderLocationMap> createState() => _OrderLocationMapState();
}

class _OrderLocationMapState extends State<OrderLocationMap> {
  static const LatLng _inLocation = LatLng(27.70507417853043, 85.30747225454336);
  LatLng? _outLocation;
  LatLng? _currentPosition;
  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  Map<PolylineId, Polyline> polylines = {};
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _currentPosition = _inLocation;
    _outLocation = widget.destination;

    _getLocationUpdates().then((_) async {
      List<LatLng> coords = await getPolylinePoints();
      generatePolylineFromPoints(coords);
    });
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
        List<LatLng> polylinePoints = await getPolylinePoints();
        generatePolylineFromPoints(polylinePoints);
        print(newPosition);
      }
    });
  }

  Future<void> _cameraToPosition(LatLng position) async {
    final controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: position, zoom: 13)),
    );
  }

  Future<List<LatLng>> getPolylinePoints() async {
    if (_currentPosition == null || _outLocation == null) return [];

    List<LatLng> polyLineCoordinates = [];
    PolylinePoints points = PolylinePoints();

    PolylineResult result = await points.getRouteBetweenCoordinates(
      googleApiKey: dotenv.env['GOOGLE_MAP_API'],
      request: PolylineRequest(
        origin: PointLatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        destination: PointLatLng(_outLocation!.latitude, _outLocation!.longitude),
        mode: TravelMode.driving,
        wayPoints: [],
      ),
    );

    if (result.points.isNotEmpty) {
      polyLineCoordinates =
          result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();
    } else {
      print("Polyline error: ${result.errorMessage}");
    }

    return polyLineCoordinates;
  }

  void generatePolylineFromPoints(List<LatLng> polylineCordinates) {
    PolylineId id = PolylineId("pId");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColors.frog,
      points: polylineCordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }

  // void _handleMapTap(LatLng tappedPoint) async {
  //   setState(() {
  //     _outLocation = tappedPoint;
  //   });

  //   List<LatLng> points = await getPolylinePoints();
  //   generatePolylineFromPoints(points);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _currentPosition == null
              ? Center(child: Text("Fetching Location"))
              : GoogleMap(
                // onTap: _handleMapTap,
                onMapCreated: (GoogleMapController controller) {
                  if (!_mapController.isCompleted) {
                    _mapController.complete(controller);
                  }
                },

                initialCameraPosition: CameraPosition(
                  target: _currentPosition ?? _inLocation,
                  zoom: 13,
                ),
                polylines: Set<Polyline>.of(polylines.values),
                markers: {
                  Marker(
                    markerId: MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentPosition!,
                  ),
                  Marker(
                    markerId: MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                    position: _inLocation,
                  ),
                  Marker(
                    markerId: MarkerId("_destinationLocation"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                    position: _outLocation!,
                    infoWindow: InfoWindow(title: 'San Francisco'),
                  ),
                },
              ),
    );
  }
}
