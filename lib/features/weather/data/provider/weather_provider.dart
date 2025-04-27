import 'package:snowcast/features/weather/data/dto/weather_dto.dart';

abstract class WeatherProvider {
  Future<WeatherDto> getWeather({required String lat, required String lon, required String alt});
}
