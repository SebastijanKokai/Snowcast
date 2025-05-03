import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';

class WeatherUsecase {
  WeatherUsecase({required this.weatherRepository});

  final WeatherRepository weatherRepository;

  Future<Weather> getWeather({required String lat, required String lon, required String alt}) async {
    return weatherRepository.getWeather(lat: lat, lon: lon, alt: alt);
  }
}
