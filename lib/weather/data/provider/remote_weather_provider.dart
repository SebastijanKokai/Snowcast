import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:snowcast/common/model/json_map.dart';
import 'package:snowcast/common/network/user_agent_client.dart';
import 'package:snowcast/weather/data/dto/weather_dto.dart';
import 'package:snowcast/weather/data/provider/weather_provider.dart';

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class RemoteWeatherProvider extends WeatherProvider {
  RemoteWeatherProvider({http.Client? httpClient})
      : _httpClient = httpClient == null
            ? UserAgentClient(_userAgent, http.Client())
            : UserAgentClient(_userAgent, httpClient);

  final UserAgentClient _httpClient;
  static const String _userAgent =
      "Snowcast/1.0.0+1 github.com/SebastijanKokai/Snowcast";
  static const String _weatherApi = "api.met.no";

  @override
  Future<WeatherDto> getWeather(
      {required String lat, required String lon, required String alt}) async {
    final weatherRequest = Uri.https(
        _weatherApi,
        "/weatherapi/locationforecast/2.0/complete",
        {'lat': lat, 'lon': lon, 'altitude': alt});

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final weatherJson = jsonDecode(weatherResponse.body) as JsonMap;

    if (!weatherJson.containsKey('properties')) {
      throw WeatherNotFoundFailure();
    }

    return WeatherDto.fromJson(weatherJson);
  }
}
