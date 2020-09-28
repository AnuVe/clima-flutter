import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lon;
  Future<void> getLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
