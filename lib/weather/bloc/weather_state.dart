import 'package:equatable/equatable.dart';
import 'package:snowcast/weather/entity/weather.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState extends Equatable {
  const WeatherState({this.status = WeatherStatus.initial, Weather? weather})
      : weather = weather ?? Weather.empty;

  final WeatherStatus status;
  final Weather weather;

  @override
  List<Object?> get props => [status, weather];

  WeatherState copyWith({WeatherStatus? status, Weather? weather}) {
    return WeatherState(
        status: status ?? this.status, weather: weather ?? this.weather);
  }
}
