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
    Weather? topWeather,
    Weather? bottomWeather,
  })  : topWeather = topWeather ?? Weather.empty,
        bottomWeather = bottomWeather ?? Weather.empty;

  final WeatherStatus status;
  final String error;
  final Weather topWeather;
  final Weather bottomWeather;

  @override
  List<Object?> get props => [status, error, topWeather, bottomWeather];

  WeatherState copyWith({
    WeatherStatus? status,
    String? error,
    Weather? topWeather,
    Weather? bottomWeather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      error: error ?? this.error,
      topWeather: topWeather ?? this.topWeather,
      bottomWeather: bottomWeather ?? this.bottomWeather,
    );
  }
}
