import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';
import 'package:snowcast/features/weather/presentation/widget/weather_icon.dart';

extension WeatherColorsX on String {
  Color get backgroundColor {
    if (contains('thunder')) return const Color(0xFF2C3E50);
    if (contains('snow')) return const Color(0xFFE0F7FA);
    if (contains('rain') || contains('sleet')) return const Color(0xFFE3F2FD);
    if (contains('fog')) return const Color(0xFFECEFF1);
    if (contains('cloudy') || contains('partlycloudy')) return const Color(0xFFF5F5F5);
    return const Color(0xFFE8F5E9);
  }

  Color get textColor {
    if (contains('thunder')) return Colors.white;
    if (contains('snow')) return const Color(0xFF01579B);
    if (contains('rain') || contains('sleet')) return const Color(0xFF0D47A1);
    if (contains('fog')) return const Color(0xFF37474F);
    if (contains('cloudy') || contains('partlycloudy')) return const Color(0xFF424242);
    return const Color(0xFF1B5E20);
  }
}

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
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

class WeatherPopulated extends StatelessWidget {
  WeatherPopulated({required Weather weather, super.key})
      : _coordinates = weather.coordinates,
        _metadata = weather.metadata,
        _weatherDetails = weather.timeseries.first.instant,
        _tempUnit = weather.metadata.units.airTemperature == 'celsius' ? "°C" : "°F",
        _fogUnit = weather.metadata.units.fogAreaFraction,
        _precipitationUnit = weather.metadata.units.precipitationAmount,
        _ultraVioletIndexClearSkyUnit = weather.metadata.units.ultraVioletIndexClearSky,
        _windSpeedUnit = weather.metadata.units.windSpeed;

  final Coordinates _coordinates;
  final Metadata _metadata;
  final WeatherDetails _weatherDetails;
  final String _tempUnit;
  final String _fogUnit;
  final String _precipitationUnit;
  final String _ultraVioletIndexClearSkyUnit;
  final String _windSpeedUnit;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _weatherDetails.symbolCode.backgroundColor;
    final textColor = _weatherDetails.symbolCode.textColor;
    final dateFormat = DateFormat('dd.MM.yyyy.');

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_coordinates.latitude.toStringAsFixed(2)}°N, ${_coordinates.longitude.toStringAsFixed(2)}°E',
                            style: context.text.titleMedium?.copyWith(color: textColor),
                          ),
                          Text(
                            'Altitude: ${_coordinates.altitude.toInt()}m',
                            style: context.text.bodySmall?.copyWith(color: textColor),
                          ),
                        ],
                      ),
                      Text(
                        'Updated: ${dateFormat.format(DateTime.parse(_metadata.updatedAt))}',
                        style: context.text.bodySmall?.copyWith(color: textColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WeatherIcon(
                        symbolCode: _weatherDetails.symbolCode,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${_weatherDetails.airTemperature}$_tempUnit',
                        style: context.text.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        WeatherDetail(
                          icon: Icons.thermostat,
                          label: 'Min/Max',
                          value:
                              '${_weatherDetails.airTemperatureMin}$_tempUnit / ${_weatherDetails.airTemperatureMax}$_tempUnit',
                          textColor: textColor,
                        ),
                        WeatherDetail(
                          icon: Icons.water_drop,
                          label: 'Precipitation',
                          value: '${_weatherDetails.precipitationAmount}$_precipitationUnit',
                          textColor: textColor,
                        ),
                        WeatherDetail(
                          icon: Icons.air,
                          label: 'Wind Speed',
                          value: '${_weatherDetails.windSpeed}$_windSpeedUnit',
                          textColor: textColor,
                        ),
                        WeatherDetail(
                          icon: Icons.wb_sunny,
                          label: 'UV Index',
                          value: '${_weatherDetails.ultraVioletIndexClearSky}$_ultraVioletIndexClearSkyUnit',
                          textColor: textColor,
                        ),
                        WeatherDetail(
                          icon: Icons.foggy,
                          label: 'Fog',
                          value: '${_weatherDetails.fogAreaFraction}$_fogUnit',
                          textColor: textColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
