import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/mountain_selector/bloc/mountain_selector_cubit.dart';
import 'package:snowcast/mountain_selector/bloc/mountain_selector_state.dart';
import 'package:snowcast/navigation/view/navigation_view.dart';
import 'package:snowcast/weather/data/repository/weather_repository.dart';
import 'package:snowcast/weather/presentation/bloc/weather_cubit.dart';

void main() {
  runApp(const MainWrapper());
}

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BlocProviderWidget(child: Navigation()));
  }
}

class BlocProviderWidget extends StatelessWidget {
  const BlocProviderWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => WeatherRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  WeatherCubit(context.read<WeatherRepository>())),
          BlocProvider(
              create: (context) =>
                  MountainSelectorCubit()..setMountain(Mountain.zlatibor))
        ],
        child: child,
      ),
    );
  }
}
