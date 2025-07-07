import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future<LatLng?> getLatLngFromAddress(String address) async {
  try {
    List<Location> locations = await locationFromAddress(address);
    if (locations.isNotEmpty) {
      final loc = locations.first;
      print('Geocoding success: ${loc.latitude}, ${loc.longitude}');
      return LatLng(loc.latitude, loc.longitude);
    } else {
      print('Geocoding returned empty location list');
    }
  } catch (e) {
    print('Geocoding error: $e');
  }
  return null;
}

Future<String> getAddressFromLatLng(LatLng position) async {
  final apiKey = dotenv.env['GOOGLE_MAP_API'];
  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('Google Maps API key is missing');
  }

  final url =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);

    if (jsonBody['status'] == 'OK') {
      final results = jsonBody['results'] as List<dynamic>;

      if (results.isNotEmpty) {
        return results[0]['formatted_address'] as String;
      } else {
        return "No address found";
      }
    } else {
      return "Geocoding error: ${jsonBody['status']}";
    }
  } else {
    return "Failed to fetch address: HTTP ${response.statusCode}";
  }
}
