import 'package:snowcast/weather/dto/weather_response.dart';
import 'package:snowcast/weather/entity/weather.dart';
import 'package:snowcast/weather/provider/remote_weather_provider.dart';
import 'package:snowcast/weather/provider/weather_provider.dart';

class WeatherRepository {
  WeatherRepository({WeatherProvider? weatherProvider})
      : _weatherProvider = weatherProvider ?? RemoteWeatherProvider();

  final WeatherProvider _weatherProvider;

  Future<Weather> getWeather(
      {required String lat, required String lon, required String alt}) async {
    final WeatherResponse weatherResponse =
        await _weatherProvider.getWeather(lat: lat, lon: lon, alt: alt);

    return weatherResponse.toEntity;
  }
}
