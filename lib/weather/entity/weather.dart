class Weather {
  const Weather({required this.coordinates, required this.metadata});

  final Coordinates coordinates;
  final Metadata metadata;

  static const empty =
      Weather(coordinates: Coordinates.empty, metadata: Metadata.empty);

  Weather copyWith({Coordinates? coordinates, Metadata? metadata}) {
    return Weather(
        coordinates: coordinates ?? this.coordinates,
        metadata: metadata ?? this.metadata);
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
