import 'package:snowcast/features/weather/data/dto/extension_dto.dart';
import 'package:snowcast/features/weather/data/dto/weather_dto.dart';
import 'package:snowcast/features/weather/data/provider/remote_weather_provider.dart';
import 'package:snowcast/features/weather/data/provider/weather_provider.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';

class WeatherRepository {
  WeatherRepository({WeatherProvider? weatherProvider}) : _weatherProvider = weatherProvider ?? RemoteWeatherProvider();

  final WeatherProvider _weatherProvider;

  Future<Weather> getWeather({required String lat, required String lon, required String alt}) async {
    try {
      final WeatherDto weatherResponse = await _weatherProvider.getWeather(lat: lat, lon: lon, alt: alt);

      return weatherResponse.toEntity;
    } catch (e) {
      throw Exception("WeatherRepository => $e");
    }
  }
}
