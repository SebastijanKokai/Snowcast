import 'package:snowcast/features/weather/data/dto/weather_dto.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';

extension WeatherDtoX on WeatherDto {
  Weather get toEntity {
    return Weather(coordinates: coordinates.toEntity, metadata: metadata.toEntity, timeseries: timeseries.toEntity);
  }
}

extension CoordinatesDtoX on CoordinatesDto {
  Coordinates get toEntity {
    return Coordinates(latitude: latitude, longitude: longitude, altitude: altitude);
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

extension TimeseriesDtoList on List<TimeseriesDto> {
  List<Timeseries> get toEntity {
    return map((e) => e.toEntity).toList();
  }
}

extension TimeseriesDtoX on TimeseriesDto {
  Timeseries get toEntity {
    return Timeseries(time, mapToEntity(instant, next6Hours));
  }

  WeatherDetails mapToEntity(WeatherDetailsDto instantDetails, FutureWeatherDetailsDto futureDetails) {
    return WeatherDetails(
        symbolCode: futureDetails.symbolCode,
        airTemperature: instantDetails.airTemperature,
        airTemperatureMax: futureDetails.airTemperatureMax,
        airTemperatureMin: futureDetails.airTemperatureMin,
        precipitationAmount: futureDetails.precipitationAmount,
        fogAreaFraction: instantDetails.fogAreaFraction,
        ultraVioletIndexClearSky: instantDetails.ultraVioletIndexClearSky,
        windFromDirection: instantDetails.windFromDirection,
        windSpeed: instantDetails.windSpeed);
  }
}
