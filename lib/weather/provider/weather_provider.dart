import 'package:snowcast/weather/dto/weather_response.dart';

abstract class WeatherProvider {
  Future<WeatherResponse> getWeather(
      {required String lat, required String lon, required String alt});
}
