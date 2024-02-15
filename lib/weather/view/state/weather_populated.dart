import 'package:flutter/material.dart';
import 'package:snowcast/weather/entity/weather.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({required this.weather, super.key}) : super();

  final Weather weather;
  final String _tempUnit = "C";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // WeatherIcon(condition: weather.weatherConditon),
        Text(weather.type),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
