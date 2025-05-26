import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({required this.textColor, super.key});

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final weatherState = context.read<WeatherCubit>().state;
    final topWeather = weatherState.topWeather;
    final bottomWeather = weatherState.bottomWeather;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${topWeather.coordinates.latitude.toStringAsFixed(2)}°N, ${topWeather.coordinates.longitude.toStringAsFixed(2)}°E',
              style: context.text.titleMedium?.copyWith(color: textColor),
            ),
            Text(
              'Top: ${topWeather.coordinates.altitude.toInt()}m | Bottom: ${bottomWeather.coordinates.altitude.toInt()}m',
              style: context.text.bodySmall?.copyWith(color: textColor),
            ),
          ],
        ),
        Text(
          l10n.updated(DateFormat('dd.MM.yyyy.').format(DateTime.parse(topWeather.metadata.updatedAt))),
          style: context.text.bodySmall?.copyWith(color: textColor),
        ),
      ],
    );
  }
}
