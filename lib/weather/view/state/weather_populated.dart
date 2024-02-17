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
        Text("Latitude: ${weather.coordinates.latitude.toString()}"),
        Text("Longitude: ${weather.coordinates.longitude.toString()}"),
        Text("Altitude: ${weather.coordinates.altitude.toString()}"),
        Text("Meta - Updated_at: ${weather.metadata.updatedAt.toString()}"),
        Text(
            "Meta - Air temp: ${weather.metadata.units.airTemperature.toString()}"),
        Text(
            "Meta - Fog area fraction: ${weather.metadata.units.fogAreaFraction.toString()}"),
        Text(
            "Meta - Precipitation amount: ${weather.metadata.units.precipitationAmount.toString()}"),
        Text(
            "Meta - Ultra violet index clear sky: ${weather.metadata.units.ultraVioletIndexClearSky.toString()}"),
        Text(
            "Meta - Wind speed: ${weather.metadata.units.windSpeed.toString()}"),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
