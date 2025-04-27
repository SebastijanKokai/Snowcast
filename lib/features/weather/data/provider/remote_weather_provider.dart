import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:snowcast/core/utils/json_map.dart';
import 'package:snowcast/core/utils/user_agent_client.dart';
import 'package:snowcast/features/weather/data/dto/weather_dto.dart';
import 'package:snowcast/features/weather/data/provider/weather_provider.dart';

class RemoteWeatherProvider extends WeatherProvider {
  RemoteWeatherProvider({http.Client? httpClient})
      : _httpClient =
            httpClient == null ? UserAgentClient(_userAgent, http.Client()) : UserAgentClient(_userAgent, httpClient);

  final UserAgentClient _httpClient;
  static final String _userAgent = dotenv.env['USER_AGENT'] ?? '';
  static final String _weatherApi = dotenv.env['WEATHER_API'] ?? '';
  static final String _weatherEndpoint = dotenv.env['WEATHER_ENDPOINT'] ?? '';

  @override
  Future<WeatherDto> getWeather({required String lat, required String lon, required String alt}) async {
    try {
      final weatherRequest = Uri.https(_weatherApi, _weatherEndpoint, {'lat': lat, 'lon': lon, 'altitude': alt});

      final weatherResponse = await _httpClient.get(weatherRequest);

      final weatherJson = jsonDecode(weatherResponse.body) as JsonMap;

      return WeatherDto.fromJson(weatherJson);
    } catch (e) {
      throw Exception('WeatherProvider => $e');
    }
  }
}
