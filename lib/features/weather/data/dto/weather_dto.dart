import 'package:snowcast/core/utils/json_map.dart';

class WeatherDto {
  WeatherDto({required this.coordinates, required this.metadata, required this.timeseries});

  final CoordinatesDto coordinates;
  final MetadataDto metadata;
  final List<TimeseriesDto> timeseries;

  static final empty = WeatherDto(
      coordinates: CoordinatesDto.empty, metadata: MetadataDto.empty, timeseries: List<TimeseriesDto>.empty());

  factory WeatherDto.fromJson(JsonMap json) {
    try {
      final timeseriesJson = json['properties']['timeseries'] as List<dynamic>;
      final List<TimeseriesDto> timeseries = timeseriesJson.map((ts) => TimeseriesDto.fromJson(ts)).toList();

      return WeatherDto(
          coordinates: CoordinatesDto.fromJson(json), metadata: MetadataDto.fromJson(json), timeseries: timeseries);
    } catch (e) {
      print("Exception: $e");
      return empty;
    }
  }
}

class CoordinatesDtoParsingException implements Exception {}

class CoordinatesDto {
  const CoordinatesDto({required this.latitude, required this.longitude, required this.altitude});

  final double latitude;
  final double longitude;
  final double altitude;

  static const empty = CoordinatesDto(latitude: 0, longitude: 0, altitude: 0);

  factory CoordinatesDto.fromJson(JsonMap json) {
    try {
      final coordinatesList = json['geometry']['coordinates'] as List<dynamic>;
      return CoordinatesDto(
          latitude: coordinatesList[0], longitude: coordinatesList[1], altitude: coordinatesList[2].toDouble());
    } catch (e) {
      print("Exception $e");
      throw CoordinatesDtoParsingException();
    }
  }
}

class MetadataDtoParsingException implements Exception {}

class MetadataDto {
  const MetadataDto(this.updatedAt, this.units);

  final String updatedAt;
  final UnitsDto units;

  static const empty = MetadataDto("", UnitsDto.empty);

  factory MetadataDto.fromJson(JsonMap json) {
    try {
      final meta = json['properties']['meta'];

      return MetadataDto(meta['updated_at'], UnitsDto.fromJson(json));
    } catch (e) {
      print("Exception $e");
      throw MetadataDtoParsingException();
    }
  }
}

class UnitsDtoParsingException implements Exception {}

class UnitsDto {
  const UnitsDto(this.airTemperature, this.airTemperatureMax, this.airTemperatureMin, this.fogAreaFraction,
      this.precipitationAmount, this.ultraVioletIndexClearSky, this.windFromDirection, this.windSpeed);

  final String airTemperature;
  final String airTemperatureMax;
  final String airTemperatureMin;
  final String fogAreaFraction;
  final String precipitationAmount;
  final String ultraVioletIndexClearSky;
  final String windFromDirection;
  final String windSpeed;

  static const empty = UnitsDto("", "", "", "", "", "", "", "");

  factory UnitsDto.fromJson(JsonMap json) {
    try {
      final unitsJson = json['properties']['meta']['units'];

      return UnitsDto(
        unitsJson['air_temperature'],
        unitsJson['air_temperature_max'],
        unitsJson['air_temperature_min'],
        unitsJson['fog_area_fraction'],
        unitsJson['precipitation_amount'],
        unitsJson['ultraviolet_index_clear_sky'],
        unitsJson['wind_from_direction'],
        unitsJson['wind_speed'],
      );
    } catch (e) {
      print("Exception $e");
      throw UnitsDtoParsingException();
    }
  }
}

class TimeseriesDtoParsingException implements Exception {}

class TimeseriesDto {
  const TimeseriesDto(this.time, this.instant, this.next6Hours);

  final String time;
  final WeatherDetailsDto instant;
  final FutureWeatherDetailsDto next6Hours;

  static const empty = TimeseriesDto("", WeatherDetailsDto.empty, FutureWeatherDetailsDto.empty);

  factory TimeseriesDto.fromJson(JsonMap json) {
    try {
      final timeJson = json['time'];
      final instantJson = json['data']['instant']['details'];
      final next6HoursJson = json['data']['next_6_hours'];
      return TimeseriesDto(
          timeJson ?? "",
          instantJson != null ? WeatherDetailsDto.fromJson(instantJson) : WeatherDetailsDto.empty,
          next6HoursJson != null ? FutureWeatherDetailsDto.fromJson(next6HoursJson) : FutureWeatherDetailsDto.empty);
    } catch (e) {
      print("Exception $e");
      throw TimeseriesDtoParsingException();
    }
  }
}

class WeatherDetailsDtoParsingException implements Exception {}

class WeatherDetailsDto {
  const WeatherDetailsDto(
      this.airTemperature, this.fogAreaFraction, this.ultraVioletIndexClearSky, this.windFromDirection, this.windSpeed);

  final double airTemperature;
  final double fogAreaFraction;
  final double ultraVioletIndexClearSky;
  final double windFromDirection;
  final double windSpeed;

  static const empty = WeatherDetailsDto(0, 0, 0, 0, 0);

  factory WeatherDetailsDto.fromJson(JsonMap json) {
    try {
      return WeatherDetailsDto(json['air_temperature'] ?? 0, json['fog_area_fraction'] ?? 0,
          json['ultraviolet_index_clear_sky'] ?? 0, json['wind_from_direction'] ?? 0, json['wind_speed'] ?? 0);
    } catch (e) {
      print("Exception $e");
      throw WeatherDetailsDtoParsingException();
    }
  }
}

class FutureWeatherDetailsDtoParsingException implements Exception {}

class FutureWeatherDetailsDto {
  const FutureWeatherDetailsDto(
      this.symbolCode, this.airTemperatureMax, this.airTemperatureMin, this.precipitationAmount);

  final String symbolCode;
  final double airTemperatureMax;
  final double airTemperatureMin;
  final double precipitationAmount;

  static const empty = FutureWeatherDetailsDto("", 0, 0, 0);

  factory FutureWeatherDetailsDto.fromJson(JsonMap json) {
    try {
      return FutureWeatherDetailsDto(
        json['summary']['symbol_code'] ?? "",
        json['details']['air_temperature_max'] ?? 0,
        json['details']['air_temperature_min'] ?? 0,
        json['details']['precipitation_amount'] ?? 0,
      );
    } catch (e) {
      print("Exception $e");
      throw FutureWeatherDetailsDtoParsingException();
    }
  }
}
