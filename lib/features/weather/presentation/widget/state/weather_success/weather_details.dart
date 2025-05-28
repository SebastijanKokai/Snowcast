import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:snowcast/features/weather/presentation/widget/weather_detail.dart';
import 'package:snowcast/core/widget/glass_container.dart';

class WeatherDetailsGrid extends StatelessWidget {
  const WeatherDetailsGrid({required this.textColor, super.key});

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final weatherState = context.read<WeatherCubit>().state;
    final topWeather = weatherState.topWeather;
    final bottomWeather = weatherState.bottomWeather;
    final topDetails = topWeather.timeseries.first.instant;
    final bottomDetails = bottomWeather.timeseries.first.instant;
    final tempUnit = topWeather.metadata.units.airTemperature == 'celsius' ? "°C" : "°F";
    final precipitationUnit = topWeather.metadata.units.precipitationAmount;
    final windSpeedUnit = topWeather.metadata.units.windSpeed;
    final ultraVioletIndexClearSkyUnit = topWeather.metadata.units.ultraVioletIndexClearSky;
    final fogUnit = topWeather.metadata.units.fogAreaFraction;

    return Expanded(
      child: GlassContainer(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
          padding: const EdgeInsets.all(12),
          children: [
            WeatherDetail(
              icon: Icons.thermostat,
              label: l10n.temperature,
              value: '',
              isTemperature: true,
              maxValue: '${topDetails.airTemperatureMax}',
              minValue: '${topDetails.airTemperatureMin}',
              tempUnit: tempUnit,
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.thermostat,
              label: l10n.temperature,
              value: '',
              isTemperature: true,
              maxValue: '${bottomDetails.airTemperatureMax}',
              minValue: '${bottomDetails.airTemperatureMin}',
              tempUnit: tempUnit,
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.water_drop,
              label: l10n.precipitation,
              value: '${topDetails.precipitationAmount}$precipitationUnit',
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.water_drop,
              label: l10n.precipitation,
              value: '${bottomDetails.precipitationAmount}$precipitationUnit',
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.air,
              label: l10n.windSpeed,
              value: '${topDetails.windSpeed}$windSpeedUnit',
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.air,
              label: l10n.windSpeed,
              value: '${bottomDetails.windSpeed}$windSpeedUnit',
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.wb_sunny,
              label: l10n.uvIndex,
              value: '${topDetails.ultraVioletIndexClearSky}$ultraVioletIndexClearSkyUnit',
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.wb_sunny,
              label: l10n.uvIndex,
              value: '${bottomDetails.ultraVioletIndexClearSky}$ultraVioletIndexClearSkyUnit',
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.foggy,
              label: l10n.fog,
              value: '${topDetails.fogAreaFraction}$fogUnit',
              textColor: textColor,
            ),
            WeatherDetail(
              icon: Icons.foggy,
              label: l10n.fog,
              value: '${bottomDetails.fogAreaFraction}$fogUnit',
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
