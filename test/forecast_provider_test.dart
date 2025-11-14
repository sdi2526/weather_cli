import 'package:test/test.dart';
import 'package:weather_cli/forecast_provider.dart';
import 'package:weather_cli/location_provider.dart';

void main() {
  test('forecast length', () async {
    var locationProvider = LocationProvider();
    var forecastProvider = ForecastProvider(locationProvider);

    bool succeeded = await forecastProvider.fetchHourlyForecast();
    expect(succeeded, true);
    expect(forecastProvider.hourlyForecast.length, 24);
  });
}
