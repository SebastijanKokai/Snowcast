import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/weather/presentation/bloc/weather_state.dart';
import 'package:snowcast/weather/data/repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather() async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      // Hardcoded Kopaonik location with base altitude
      final weather = await _weatherRepository.getWeather(
          lat: "43.268045", lon: "20.826309", alt: "1770");

      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
    } catch (e) {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }
}
