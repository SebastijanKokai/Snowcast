import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.symbolCode,
  });

  final String symbolCode;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      symbolCode.toIconPath,
      semanticsLabel: symbolCode,
    );
  }
}

extension on String {
  String get toIconPath {
    switch (this) {
      case "clear_sky":
        return "assets/weather_icons/clearsky_day.svg";
      case "cloudy":
        return "assets/weather_icons/cloudy.svg";
      default:
        return "assets/weather_icons/clearsky_day.svg";
    }
  }
}
