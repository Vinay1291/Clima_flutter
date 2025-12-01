import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;




  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("User didn't allow their data to you!");
    } else {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
      );
      try {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings,
        );

        latitude = position.latitude;
        longitude = position.longitude;
        // At this point, the data is ready!
      } catch (e) {
        Exception(e);
      }
    }
  }
}