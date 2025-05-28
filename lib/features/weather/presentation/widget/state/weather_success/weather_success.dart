import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/core/extensions/weather_colors_extension.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:snowcast/features/weather/presentation/widget/state/weather_success/weather_details.dart';
import 'package:snowcast/features/weather/presentation/widget/state/weather_success/weather_section.dart';
import 'package:snowcast/core/widget/glass_container.dart';
import 'package:snowcast/core/widget/glass_button.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final weatherState = context.read<WeatherCubit>().state;
    final topWeather = weatherState.topWeather;
    final bottomWeather = weatherState.bottomWeather;
    final textColor = topWeather.timeseries.first.instant.symbolCode.textColor;

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          _WeatherMetaHeader(textColor: textColor),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: GlassContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              child: GlassButton(
                onPressed: () {},
                text: l10n.nineDayForecast,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherMetaHeader extends StatelessWidget {
  const _WeatherMetaHeader({required this.textColor});
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final weatherState = context.read<WeatherCubit>().state;
    final topWeather = weatherState.topWeather;
    final bottomWeather = weatherState.bottomWeather;
    return Column(
      children: [
        Text(
          '${l10n.top}: ${topWeather.coordinates.altitude.toInt()} m   |   ${l10n.bottom}: ${bottomWeather.coordinates.altitude.toInt()} m',
          style: context.text.bodyMedium?.copyWith(color: textColor),
        ),
        const SizedBox(height: 4),
        Text(
          '${l10n.updatedAt}: ${topWeather.metadata.updatedAt}',
          style: context.text.bodySmall?.copyWith(color: textColor.withOpacity(0.8)),
        ),
      ],
    );
  }
}
