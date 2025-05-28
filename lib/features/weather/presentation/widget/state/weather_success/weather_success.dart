import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/core/extensions/weather_colors_extension.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:snowcast/features/weather/presentation/widget/state/weather_success/weather_details.dart';
import 'package:snowcast/features/weather/presentation/widget/state/weather_success/weather_section.dart';
import 'package:snowcast/core/theme/app_colors.dart';
import 'package:snowcast/core/widget/glass_container.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final weatherState = context.read<WeatherCubit>().state;
    final topWeather = weatherState.topWeather;
    final bottomWeather = weatherState.bottomWeather;
    final symbolCode = topWeather.timeseries.first.instant.symbolCode;
    final gradient = symbolCode.weatherGradient;
    final backgroundColor = topWeather.timeseries.first.instant.symbolCode.backgroundColor;
    final textColor = topWeather.timeseries.first.instant.symbolCode.textColor;

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: SafeArea(
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
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.defaultBackground,
                    foregroundColor: AppColors.defaultText,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('9-day forecast'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherMetaHeader extends StatelessWidget {
  const _WeatherMetaHeader({required this.textColor});
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final weatherState = context.read<WeatherCubit>().state;
    final topWeather = weatherState.topWeather;
    final bottomWeather = weatherState.bottomWeather;
    return Column(
      children: [
        Text(
          '${topWeather.coordinates.latitude.toStringAsFixed(4)}, ${topWeather.coordinates.longitude.toStringAsFixed(4)}',
          style: context.text.bodyMedium?.copyWith(color: textColor),
        ),
        const SizedBox(height: 4),
        Text(
          'Top: ${topWeather.coordinates.altitude.toInt()} m   |   Bottom: ${bottomWeather.coordinates.altitude.toInt()} m',
          style: context.text.bodyMedium?.copyWith(color: textColor),
        ),
        const SizedBox(height: 4),
        Text(
          'Updated: ${topWeather.metadata.updatedAt}',
          style: context.text.bodySmall?.copyWith(color: textColor.withOpacity(0.8)),
        ),
      ],
    );
  }
}
