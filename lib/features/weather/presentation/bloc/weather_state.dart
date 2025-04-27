import 'package:equatable/equatable.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState extends Equatable {
  WeatherState({
    this.status = WeatherStatus.initial,
    this.error = '',
    Weather? weather,
  }) : weather = weather ?? Weather.empty;

  final WeatherStatus status;
  final String error;
  final Weather weather;

  @override
  List<Object?> get props => [status, error, weather];

  WeatherState copyWith({WeatherStatus? status, String? error, Weather? weather}) {
    return WeatherState(
      status: status ?? this.status,
      error: error ?? this.error,
      weather: weather ?? this.weather,
    );
  }
}
