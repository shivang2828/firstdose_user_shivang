import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CurrentLocation extends GetxController {

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // await Geolocator.requestPermission();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return an error.
      return Future.error('Location services are disabled.');

    }

    // Check location permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission if it is denied
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return an error.
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, return an error.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // Permissions are granted, get the current position.
    return await Geolocator.getCurrentPosition();
  }

  // Public method to get the current location
  Future<Position> getCurrentLocation() async {
    try {
      return await _determinePosition();
    } catch (e) {
      // Handle the error and provide feedback
      print("Error: $e");
      debugPrint("Error: $e");
      return Future.error(e);
    }
  }
}
