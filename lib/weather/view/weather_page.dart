import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/weather/bloc/weather_cubit.dart';
import 'package:snowcast/weather/bloc/weather_state.dart';
import 'package:snowcast/weather/entity/weather.dart';
import 'package:snowcast/weather/repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: BlocProvider(
        create: (context) =>
            WeatherCubit(context.read<WeatherRepository>())..getWeather(),
        child: const WeatherView(),
      ),
    );
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

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No weather data found."),
    );
  }
}

class WeatherError extends StatelessWidget {
  const WeatherError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Something went wrong."),
    );
  }
}

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fetching weather data...',
          ),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({required this.weather, super.key}) : super();

  final Weather weather;
  final String _tempUnit = "C";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // WeatherIcon(condition: weather.weatherConditon),
        Text(weather.type),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
