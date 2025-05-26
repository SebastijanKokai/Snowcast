import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/core/extensions/weather_colors_extension.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:snowcast/features/weather/presentation/widget/state/weather_success/location_header.dart';
import 'package:snowcast/features/weather/presentation/widget/state/weather_success/weather_details.dart';
import 'package:snowcast/features/weather/presentation/widget/state/weather_success/weather_section.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final weatherState = context.read<WeatherCubit>().state;
    final topWeather = weatherState.topWeather;
    final bottomWeather = weatherState.bottomWeather;
    final backgroundColor = topWeather.timeseries.first.instant.symbolCode.backgroundColor;
    final textColor = topWeather.timeseries.first.instant.symbolCode.textColor;

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  LocationHeader(textColor: textColor),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: WeatherSection(
                          title: l10n.top,
                          weatherDetails: topWeather.timeseries.first.instant,
                          tempUnit: topWeather.metadata.units.airTemperature == 'celsius' ? "°C" : "°F",
                          textColor: textColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: WeatherSection(
                          title: l10n.bottom,
                          weatherDetails: bottomWeather.timeseries.first.instant,
                          tempUnit: bottomWeather.metadata.units.airTemperature == 'celsius' ? "°C" : "°F",
                          textColor: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  WeatherDetailsGrid(textColor: textColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
