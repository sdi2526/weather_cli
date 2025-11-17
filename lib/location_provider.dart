import 'location_data.dart';

class LocationProvider {
  final List<LocationData> _locations = [
    // adapted location for Aschaffenburg to be in the center of TH campus
    // (same as used in last version of Guenther's open_meteo_ui)
    LocationData(name: "Aschaffenburg", latitude: 49.97198, longitude: 9.16138),
    LocationData(name: "Sydney", latitude: -33.86785, longitude: 151.20732),
    LocationData(name: "New York", latitude: 40.71427, longitude: -74.00597),
    LocationData(name: "Tokio", latitude: 35.6895, longitude: 139.69171),
  ];

  String _selectedLocationName = "Aschaffenburg";

  bool selectLocation(String name) {
    for (var location in _locations) {
      if (location.name == name) {
        _selectedLocationName = location.name;
        return true;
      }
    }
    print("selectLocation: location $name not found");
    return false;
  }

  LocationData get selectedLocation {
    LocationData? result;
    // for (var location in _locations) {
    //   if (location.name == _selectedLocationName) {
    //     result = location;
    //   }
    // }
    // if (result == null) {
    //   throw ("getter selectedLocation: did not find location for $_selectedLocationName");
    // }

    result = _locations.firstWhere(
      (element) => element.name == _selectedLocationName,
    );

    return result;
  }

  List<String> getLocationNames() {
    // List<String> result = [];
    // for (var location in _locations) {
    //   result.add(location.name);
    // }
    // return result;

    return _locations.map((data) => data.name).toList();
  }
}
