import 'package:snowcast/common/model/json_map.dart';
import 'package:snowcast/weather/entity/weather.dart';

extension WeatherDtoX on WeatherDto {
  Weather get toEntity {
    return Weather(
        coordinates: coordinates.toEntity, metadata: metadata.toEntity);
  }
}

extension CoordinatesDtoX on CoordinatesDto {
  Coordinates get toEntity {
    return Coordinates(
        latitude: latitude, longitude: longitude, altitude: altitude);
  }
}

extension MetadataDtoX on MetadataDto {
  Metadata get toEntity {
    return Metadata(updatedAt: updatedAt, units: units.toEntity);
  }
}

extension UnitsDtoX on UnitsDto {
  Units get toEntity {
    return Units(
        airTemperature: airTemperature,
        airTemperatureMax: airTemperatureMax,
        airTemperatureMin: airTemperatureMin,
        fogAreaFraction: fogAreaFraction,
        precipitationAmount: precipitationAmount,
        ultraVioletIndexClearSky: ultraVioletIndexClearSky,
        windFromDirection: windFromDirection,
        windSpeed: windSpeed);
  }
}

class WeatherDto {
  const WeatherDto({required this.coordinates, required this.metadata});

  final CoordinatesDto coordinates;
  final MetadataDto metadata;

  static const empty = WeatherDto(
      coordinates: CoordinatesDto.empty, metadata: MetadataDto.empty);

  factory WeatherDto.fromJson(JsonMap json) {
    try {
      return WeatherDto(
          coordinates: CoordinatesDto.fromJson(json),
          metadata: MetadataDto.fromJson(json));
    } on Exception {
      // Handle it?
      return empty;
    }
  }
}

class CoordinatesDtoParsingException implements Exception {}

class CoordinatesDto {
  const CoordinatesDto(
      {required this.latitude,
      required this.longitude,
      required this.altitude});

  final double latitude;
  final double longitude;
  final double altitude;

  static const empty = CoordinatesDto(latitude: 0, longitude: 0, altitude: 0);

  factory CoordinatesDto.fromJson(JsonMap json) {
    try {
      final coordinatesList = json['geometry']['coordinates'] as List<dynamic>;
      return CoordinatesDto(
          latitude: coordinatesList[0],
          longitude: coordinatesList[1],
          altitude: coordinatesList[2].toDouble());
    } on Exception {
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
    } on Exception {
      throw MetadataDtoParsingException();
    }
  }
}

class UnitsDtoParsingException implements Exception {}

class UnitsDto {
  const UnitsDto(
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
    } on Exception {
      throw UnitsDtoParsingException();
    }
  }
}

class TimeseriesDtoParsingException implements Exception {}

class TimeseriesDto {}
