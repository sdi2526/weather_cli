import 'package:test/test.dart';
import 'package:weather_cli/location_provider.dart';

void main() {
  test('getLocationNames', () {
    var locationProvider = LocationProvider();
    var names = locationProvider.getLocationNames();

    expect(names.length, 5);
  });

  test('selectLocation', () {
    var locationProvider = LocationProvider();
    // default is Aschaffenburg
    var location = locationProvider.selectedLocation;
    expect(location.name, "Aschaffenburg");

    var result = locationProvider.selectLocation("Sydney");
    expect(result, true);
    expect(locationProvider.selectedLocation.name, "Sydney");

    result = locationProvider.selectLocation("xxx");
    expect(result, false);
    expect(locationProvider.selectedLocation.name, "Sydney");
  });
}
