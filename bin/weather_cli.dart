import 'package:weather_cli/forecast_provider.dart';
import 'package:weather_cli/location_provider.dart';
// a bit strange: the next line leads to warning "Can't use a relative path to import a library in 'lib'."
//import '../lib/location_provider.dart';

void main(List<String> arguments) async {
  var locationProvider = LocationProvider();
  locationProvider.selectLocation("Sydney");
  var forecastProvider = ForecastProvider(locationProvider);

  bool succeeded = await forecastProvider.fetchHourlyForecast();
  if (!succeeded) {
    print("fetchHourlyForecast did not suceed.");
    return;
  }

  print("this is the forecast for ${locationProvider.selectedLocation.name}:");
  for (var e in forecastProvider.hourlyForecast) {
    print("${e.localTime}: ${e.temp}°C, ${e.precipAmount}mm, ${e.cloudCover}%");
  }
}
