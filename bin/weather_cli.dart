import 'package:weather_cli/location_provider.dart';
// a bit strange: the next line leads to warning "Can't use a relative path to import a library in 'lib'."
//import '../lib/location_provider.dart';

void main(List<String> arguments) {
  var locationProvider = LocationProvider();
  locationProvider.getLocationNames();
}
