import 'package:snowcast/common/model/json_map.dart';
import 'package:snowcast/weather/entity/weather.dart';

extension WeatherResponseX on WeatherResponse {
  Weather get toEntity {
    return Weather(type: type);
  }
}

class WeatherResponse {
  WeatherResponse(this.type);

  final String type;

  factory WeatherResponse.fromJson(JsonMap json) {
    return WeatherResponse(json['type']);
  }
}

class Metadata {
  Metadata(this.updatedAt, this.units);

  final String updatedAt;
  final Units units;
}

class Units {
  Units(
      this.airTemperature,
      this.airTemperatureMax,
      this.airTemperatureMin,
      this.fogAreaFraction,
      this.precipitationAmount,
      this.ultraVioletIndexClearSky,
      this.windFromDirection,
      this.windSpeed);

  final String airTemperature;
  final String airTemperatureMax;
  final String airTemperatureMin;
  final String fogAreaFraction;
  final String precipitationAmount;
  final String ultraVioletIndexClearSky;
  final String windFromDirection;
  final String windSpeed;
}
