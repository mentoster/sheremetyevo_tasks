import 'dart:async';

import 'package:location/location.dart';

class GetCoords {
  Future<bool> canUse() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return true;
      }
    }
    return true;
  }

  Future<LocationData> getPosition() async {
    Location location = new Location();
    LocationData _locationData;
    _locationData = await location.getLocation();
    return _locationData;
  }
}
