import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather(
      {required double lat, required double lon, required int topAlt, required int bottomAlt}) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final topWeather = await _weatherRepository.getWeather(
        lat: lat.toString(),
        lon: lon.toString(),
        alt: topAlt.toString(),
      );

      final bottomWeather = await _weatherRepository.getWeather(
        lat: lat.toString(),
        lon: lon.toString(),
        alt: bottomAlt.toString(),
      );

      emit(state.copyWith(
        status: WeatherStatus.success,
        topWeather: topWeather,
        bottomWeather: bottomWeather,
      ));
    } catch (e) {
      emit(
        state.copyWith(status: WeatherStatus.failure, error: 'WeatherCubit => $e'),
      );
    }
  }
}
