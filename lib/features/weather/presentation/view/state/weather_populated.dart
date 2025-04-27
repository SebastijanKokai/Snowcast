import 'package:flutter/material.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';
import 'package:snowcast/features/weather/presentation/view/weather_icon.dart';

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
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        WeatherIcon(symbolCode: _weatherDetails.symbolCode),
        Text("Latitude: ${_coordinates.latitude}"),
        Text("Longitude: ${_coordinates.longitude}"),
        Text("Altitude: ${_coordinates.altitude}"),
        Text("Meta - Updated_at: ${_metadata.updatedAt}"),
        Text("Air temp: ${_weatherDetails.airTemperature}$_tempUnit"),
        Text("Air temp Max: ${_weatherDetails.airTemperatureMax}$_tempUnit"),
        Text("Air temp Min: ${_weatherDetails.airTemperatureMin}$_tempUnit"),
        Text("Fog area fraction: ${_weatherDetails.fogAreaFraction}$_fogUnit"),
        Text("Precipitation amount: ${_weatherDetails.precipitationAmount}$_precipitationUnit"),
        Text("Ultra violet index clear sky: ${_weatherDetails.ultraVioletIndexClearSky}$_ultraVioletIndexClearSkyUnit"),
        Text("Wind speed: ${_weatherDetails.windSpeed}$_windSpeedUnit"),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
