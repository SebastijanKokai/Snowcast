class Weather {
  Weather(
      {required this.coordinates,
      required this.metadata,
      required this.timeseries});

  final Coordinates coordinates;
  final Metadata metadata;
  final List<Timeseries> timeseries;

  static final empty = Weather(
      coordinates: Coordinates.empty,
      metadata: Metadata.empty,
      timeseries: List<Timeseries>.empty());

  Weather copyWith(
      {Coordinates? coordinates,
      Metadata? metadata,
      List<Timeseries>? timeseries}) {
    return Weather(
        coordinates: coordinates ?? this.coordinates,
        metadata: metadata ?? this.metadata,
        timeseries: timeseries ?? this.timeseries);
  }
}

class Coordinates {
  const Coordinates(
      {required this.latitude,
      required this.longitude,
      required this.altitude});

  final double latitude;
  final double longitude;
  final double altitude;

  static const empty = Coordinates(latitude: 0, longitude: 0, altitude: 0);
}

class Metadata {
  const Metadata({required this.updatedAt, required this.units});

  final String updatedAt;
  final Units units;

  static const empty = Metadata(updatedAt: "", units: Units.empty);
}

class Units {
  const Units(
      {required this.airTemperature,
      required this.airTemperatureMax,
      required this.airTemperatureMin,
      required this.fogAreaFraction,
      required this.precipitationAmount,
      required this.ultraVioletIndexClearSky,
      required this.windFromDirection,
      required this.windSpeed});

  final String airTemperature;
  final String airTemperatureMax;
  final String airTemperatureMin;
  final String fogAreaFraction;
  final String precipitationAmount;
  final String ultraVioletIndexClearSky;
  final String windFromDirection;
  final String windSpeed;

  static const empty = Units(
      airTemperature: '',
      airTemperatureMax: '',
      airTemperatureMin: '',
      fogAreaFraction: '',
      precipitationAmount: '',
      ultraVioletIndexClearSky: '',
      windFromDirection: '',
      windSpeed: '');
}

class Timeseries {
  const Timeseries(this.time, this.instant);

  final String time;
  final WeatherDetails instant;

  static const empty = Timeseries("", WeatherDetails.empty);
}

class WeatherDetails {
  const WeatherDetails(
      {required this.symbolCode,
      required this.airTemperature,
      required this.airTemperatureMax,
      required this.airTemperatureMin,
      required this.precipitationAmount,
      required this.fogAreaFraction,
      required this.ultraVioletIndexClearSky,
      required this.windFromDirection,
      required this.windSpeed});

  final String symbolCode;
  final double airTemperature;
  final double airTemperatureMax;
  final double airTemperatureMin;
  final double precipitationAmount;
  final double fogAreaFraction;
  final double ultraVioletIndexClearSky;
  final double windFromDirection;
  final double windSpeed;

  static const empty = WeatherDetails(
      symbolCode: "",
      airTemperature: 0,
      airTemperatureMax: 0,
      airTemperatureMin: 0,
      precipitationAmount: 0,
      fogAreaFraction: 0,
      ultraVioletIndexClearSky: 0,
      windFromDirection: 0,
      windSpeed: 0);
}
