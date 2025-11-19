import 'package:test/test.dart';
import 'package:weather_cli/forecast_provider.dart';
import 'package:weather_cli/location_provider.dart';

void main() {
  test('forecast length', () async {
    var locationProvider = LocationProvider();
    var forecastProvider = ForecastProvider(locationProvider);

    var now = DateTime.now();
    var currentHour = now.hour;

    bool succeeded = await forecastProvider.fetchHourlyForecast();
    expect(succeeded, true);
    expect(forecastProvider.hourlyForecast.length, 48 - currentHour - 1);
  });

  test('Sydney local time is after Aschaffenburg time', () async {
    var locationProvider = LocationProvider();
    var forecastProvider = ForecastProvider(locationProvider);

    bool succeeded = locationProvider.selectLocation("Sydney");
    expect(succeeded, true);
    succeeded = await forecastProvider.fetchHourlyForecast();
    expect(succeeded, true);
    var sydneyLocalTime = forecastProvider.hourlyForecast[0].localTime;

    succeeded = locationProvider.selectLocation("Aschaffenburg");
    expect(succeeded, true);
    succeeded = await forecastProvider.fetchHourlyForecast();
    expect(succeeded, true);
    var aschaffenburgLocalTime = forecastProvider.hourlyForecast[0].localTime;

    expect(sydneyLocalTime.isAfter(aschaffenburgLocalTime), true);
  });

  test('New York local time is before Aschaffenburg time', () async {
    var locationProvider = LocationProvider();
    var forecastProvider = ForecastProvider(locationProvider);

    bool succeeded = locationProvider.selectLocation("New York");
    expect(succeeded, true);
    succeeded = await forecastProvider.fetchHourlyForecast();
    expect(succeeded, true);
    var newYorkLocalTime = forecastProvider.hourlyForecast[0].localTime;

    succeeded = locationProvider.selectLocation("Aschaffenburg");
    expect(succeeded, true);
    succeeded = await forecastProvider.fetchHourlyForecast();
    expect(succeeded, true);
    var aschaffenburgLocalTime = forecastProvider.hourlyForecast[0].localTime;

    expect(newYorkLocalTime.isBefore(aschaffenburgLocalTime), true);
  });

  test('enforce API error', () async {
    var locationProvider = LocationProvider();
    var forecastProvider = ForecastProvider(locationProvider);

    bool succeeded = locationProvider.selectLocation("invalid");
    expect(succeeded, true);
    succeeded = await forecastProvider.fetchHourlyForecast();
    expect(succeeded, false);
    expect(forecastProvider.hourlyForecast.length, 0);
  });
}
