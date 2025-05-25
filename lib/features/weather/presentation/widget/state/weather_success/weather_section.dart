import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';
import 'package:snowcast/features/weather/presentation/widget/weather_icon.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({
    required this.title,
    required this.weatherDetails,
    required this.tempUnit,
    required this.textColor,
    super.key,
  });

  final String title;
  final WeatherDetails weatherDetails;
  final String tempUnit;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.text.labelMedium?.copyWith(color: textColor),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          child: WeatherIcon(
            symbolCode: weatherDetails.symbolCode,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${weatherDetails.airTemperature}$tempUnit',
          style: context.text.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
