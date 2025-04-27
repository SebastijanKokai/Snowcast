import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_state.dart';

import 'state/states.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        child: const WeatherView(),
      ),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  void _getWeather(BuildContext context) {
    final state = context.read<MountainCubit>().state;
    final mountain = state.selectedMountain;
    final lat = mountain.latitude;
    final lon = mountain.longitude;
    final alt = mountain.altitude;

    context.read<WeatherCubit>().getWeather(lat: lat, lon: lon, alt: alt);
  }

  @override
  void initState() {
    super.initState();
    _getWeather(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MountainCubit, MountainState>(
        listenWhen: (previous, current) => previous.selectedMountain != current.selectedMountain,
        listener: (context, state) => _getWeather(context),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            switch (state.status) {
              case WeatherStatus.initial:
                return const WeatherEmpty();
              case WeatherStatus.loading:
                return const WeatherLoading();
              case WeatherStatus.success:
                return WeatherPopulated(weather: state.weather);
              case WeatherStatus.failure:
                return WeatherError(text: state.error);
            }
          },
        ),
      ),
    );
  }
}
