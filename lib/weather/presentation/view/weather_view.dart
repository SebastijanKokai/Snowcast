import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/weather/presentation/bloc/weather_cubit.dart';
import 'package:snowcast/weather/presentation/bloc/weather_state.dart';

import 'state/states.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WeatherView();
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Page")),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state.status) {
            case WeatherStatus.initial:
              return const WeatherEmpty();
            case WeatherStatus.loading:
              return const WeatherLoading();
            case WeatherStatus.success:
              return WeatherPopulated(weather: state.weather);
            case WeatherStatus.failure:
              return const WeatherError();
          }
        },
      ),
    );
  }
}
