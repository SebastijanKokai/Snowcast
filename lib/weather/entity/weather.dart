class Weather {
  const Weather({required this.type});

  final String type;

  static const empty = Weather(type: '');

  Weather copyWith({String? type}) {
    return Weather(type: type ?? this.type);
  }
}
