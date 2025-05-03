import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/di/injection_container.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_state.dart';
import 'package:snowcast/features/weather/presentation/widget/state/states.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherCubit>(),
      child: const WeatherView(),
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
    final mountain = context.read<MountainCubit>().state.selectedMountain;
    context.read<WeatherCubit>().getWeather(
          lat: mountain.latitude,
          lon: mountain.longitude,
          topAlt: mountain.topAltitude,
          bottomAlt: mountain.bottomAltitude,
        );
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
                return const WeatherSuccess();
              case WeatherStatus.failure:
                return WeatherError(text: state.error);
            }
          },
        ),
      ),
    );
  }
}
