import 'package:equatable/equatable.dart';
import 'package:snowcast/core/error/weather_error_code.dart';
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
    Weather? topWeather,
    Weather? bottomWeather,
    this.errorCode = AppErrorCode.unknown,
  })  : topWeather = topWeather ?? Weather.empty,
        bottomWeather = bottomWeather ?? Weather.empty;

  final WeatherStatus status;
  final Weather topWeather;
  final Weather bottomWeather;
  final AppErrorCode errorCode;

  @override
  List<Object?> get props => [status, topWeather, bottomWeather, errorCode];

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? topWeather,
    Weather? bottomWeather,
    AppErrorCode? errorCode,
  }) {
    return WeatherState(
      status: status ?? this.status,
      topWeather: topWeather ?? this.topWeather,
      bottomWeather: bottomWeather ?? this.bottomWeather,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}
