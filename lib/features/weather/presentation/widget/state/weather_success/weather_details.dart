import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';

class WeatherDetailsGrid extends StatelessWidget {
  const WeatherDetailsGrid({required this.textColor, super.key});

  final Color textColor;

  @override
  Widget build(BuildContext context) {
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
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          WeatherDetail(
            icon: Icons.thermostat,
            label: 'Min/Max (Top)',
            value: '${topDetails.airTemperatureMin}$tempUnit / ${topDetails.airTemperatureMax}$tempUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.thermostat,
            label: 'Min/Max (Bottom)',
            value: '${bottomDetails.airTemperatureMin}$tempUnit / ${bottomDetails.airTemperatureMax}$tempUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.water_drop,
            label: 'Precipitation (Top)',
            value: '${topDetails.precipitationAmount}$precipitationUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.water_drop,
            label: 'Precipitation (Bottom)',
            value: '${bottomDetails.precipitationAmount}$precipitationUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.air,
            label: 'Wind Speed (Top)',
            value: '${topDetails.windSpeed}$windSpeedUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.air,
            label: 'Wind Speed (Bottom)',
            value: '${bottomDetails.windSpeed}$windSpeedUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.wb_sunny,
            label: 'UV Index (Top)',
            value: '${topDetails.ultraVioletIndexClearSky}$ultraVioletIndexClearSkyUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.wb_sunny,
            label: 'UV Index (Bottom)',
            value: '${bottomDetails.ultraVioletIndexClearSky}$ultraVioletIndexClearSkyUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.foggy,
            label: 'Fog (Top)',
            value: '${topDetails.fogAreaFraction}$fogUnit',
            textColor: textColor,
          ),
          WeatherDetail(
            icon: Icons.foggy,
            label: 'Fog (Bottom)',
            value: '${bottomDetails.fogAreaFraction}$fogUnit',
            textColor: textColor,
          ),
        ],
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: textColor),
          const SizedBox(height: 8),
          Text(
            label,
            style: context.text.labelSmall?.copyWith(color: textColor),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: context.text.titleMedium?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
