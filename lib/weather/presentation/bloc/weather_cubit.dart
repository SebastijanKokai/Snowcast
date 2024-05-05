import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/weather/presentation/bloc/weather_state.dart';
import 'package:snowcast/weather/data/repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather(
      {required String lat, required String lon, required String alt}) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather =
          await _weatherRepository.getWeather(lat: lat, lon: lon, alt: alt);

      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
    } catch (e) {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }
}
