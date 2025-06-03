import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/di/injection_container.dart';
import 'package:snowcast/core/extensions/weather_colors_extension.dart';
import 'package:snowcast/core/theme/gradient_cubit/gradient_cubit.dart';
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

  void _setGradient(BuildContext context, WeatherState state) {
    if (state.status != WeatherStatus.success) {
      return;
    }

    final symbolCode = state.topWeather.timeseries.first.instant.symbolCode;
    context.read<GradientCubit>().setGradient(symbolCode.weatherGradient);
  }

  @override
  void initState() {
    super.initState();
    _getWeather(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<MountainCubit, MountainState>(
            listenWhen: (previous, current) => previous.selectedMountain != current.selectedMountain,
            listener: (context, state) => _getWeather(context),
          ),
          BlocListener<WeatherCubit, WeatherState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) => _setGradient(context, state),
          ),
        ],
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
                return WeatherError(errorCode: state.errorCode);
            }
          },
        ),
      ),
    );
  }
}
