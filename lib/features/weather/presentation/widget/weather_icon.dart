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
      case "clearsky_day":
        return "assets/weather_icons/01d.svg";
      case "clearsky_night":
        return "assets/weather_icons/01n.svg";
      case "clearsky_polartwilight":
        return "assets/weather_icons/01m.svg";
      case "fair_day":
        return "assets/weather_icons/02d.svg";
      case "fair_night":
        return "assets/weather_icons/02n.svg";
      case "fair_polartwilight":
        return "assets/weather_icons/02m.svg";
      case "partlycloudy_day":
        return "assets/weather_icons/03d.svg";
      case "partlycloudy_night":
        return "assets/weather_icons/03n.svg";
      case "partlycloudy_polartwilight":
        return "assets/weather_icons/03m.svg";
      case "cloudy":
        return "assets/weather_icons/04.svg";
      case "rainshowers_day":
        return "assets/weather_icons/05d.svg";
      case "rainshowers_night":
        return "assets/weather_icons/05n.svg";
      case "rainshowers_polartwilight":
        return "assets/weather_icons/05m.svg";
      case "rainshowersandthunder_day":
        return "assets/weather_icons/06d.svg";
      case "rainshowersandthunder_night":
        return "assets/weather_icons/06n.svg";
      case "rainshowersandthunder_polartwilight":
        return "assets/weather_icons/06m.svg";
      case "sleetshowers_day":
        return "assets/weather_icons/07d.svg";
      case "sleetshowers_night":
        return "assets/weather_icons/07n.svg";
      case "sleetshowers_polartwilight":
        return "assets/weather_icons/07m.svg";
      case "snowshowers_day":
        return "assets/weather_icons/08d.svg";
      case "snowshowers_night":
        return "assets/weather_icons/08n.svg";
      case "snowshowers_polartwilight":
        return "assets/weather_icons/08m.svg";
      case "rain":
        return "assets/weather_icons/09.svg";
      case "heavyrain":
        return "assets/weather_icons/10.svg";
      case "heavyrainandthunder":
        return "assets/weather_icons/11.svg";
      case "sleet":
        return "assets/weather_icons/12.svg";
      case "snow":
        return "assets/weather_icons/13.svg";
      case "snowandthunder":
        return "assets/weather_icons/14.svg";
      case "fog":
        return "assets/weather_icons/15.svg";
      case "sleetshowersandthunder_day":
        return "assets/weather_icons/20d.svg";
      case "sleetshowersandthunder_night":
        return "assets/weather_icons/20n.svg";
      case "sleetshowersandthunder_polartwilight":
        return "assets/weather_icons/20m.svg";
      case "snowshowersandthunder_day":
        return "assets/weather_icons/21d.svg";
      case "snowshowersandthunder_night":
        return "assets/weather_icons/21n.svg";
      case "snowshowersandthunder_polartwilight":
        return "assets/weather_icons/21m.svg";
      case "rainandthunder":
        return "assets/weather_icons/22.svg";
      case "sleetandthunder":
        return "assets/weather_icons/23.svg";
      case "lightrainshowersandthunder_day":
        return "assets/weather_icons/24d.svg";
      case "lightrainshowersandthunder_night":
        return "assets/weather_icons/24n.svg";
      case "lightrainshowersandthunder_polartwilight":
        return "assets/weather_icons/24m.svg";
      case "heavyrainshowersandthunder_day":
        return "assets/weather_icons/25d.svg";
      case "heavyrainshowersandthunder_night":
        return "assets/weather_icons/25n.svg";
      case "heavyrainshowersandthunder_polartwilight":
        return "assets/weather_icons/25m.svg";
      case "lightssleetshowersandthunder_day":
        return "assets/weather_icons/26d.svg";
      case "lightssleetshowersandthunder_night":
        return "assets/weather_icons/26n.svg";
      case "lightssleetshowersandthunder_polartwilight":
        return "assets/weather_icons/26m.svg";
      case "heavysleetshowersandthunder_day":
        return "assets/weather_icons/27d.svg";
      case "heavysleetshowersandthunder_night":
        return "assets/weather_icons/27n.svg";
      case "heavysleetshowersandthunder_polartwilight":
        return "assets/weather_icons/27m.svg";
      case "lightssnowshowersandthunder_day":
        return "assets/weather_icons/28d.svg";
      case "lightssnowshowersandthunder_night":
        return "assets/weather_icons/28n.svg";
      case "lightssnowshowersandthunder_polartwilight":
        return "assets/weather_icons/28m.svg";
      case "heavysnowshowersandthunder_day":
        return "assets/weather_icons/29d.svg";
      case "heavysnowshowersandthunder_night":
        return "assets/weather_icons/29n.svg";
      case "heavysnowshowersandthunder_polartwilight":
        return "assets/weather_icons/29m.svg";
      case "lightrainandthunder":
        return "assets/weather_icons/30.svg";
      case "lightsleetandthunder":
        return "assets/weather_icons/31.svg";
      case "heavysleetandthunder":
        return "assets/weather_icons/32.svg";
      case "lightsnowandthunder":
        return "assets/weather_icons/33.svg";
      case "heavysnowandthunder":
        return "assets/weather_icons/34.svg";
      case "lightrainshowers_day":
        return "assets/weather_icons/40d.svg";
      case "lightrainshowers_night":
        return "assets/weather_icons/40n.svg";
      case "lightrainshowers_polartwilight":
        return "assets/weather_icons/40m.svg";
      case "heavyrainshowers_day":
        return "assets/weather_icons/41d.svg";
      case "heavyrainshowers_night":
        return "assets/weather_icons/41n.svg";
      case "heavyrainshowers_polartwilight":
        return "assets/weather_icons/41m.svg";
      case "lightsleetshowers_day":
        return "assets/weather_icons/42d.svg";
      case "lightsleetshowers_night":
        return "assets/weather_icons/42n.svg";
      case "lightsleetshowers_polartwilight":
        return "assets/weather_icons/42m.svg";
      case "heavysleetshowers_day":
        return "assets/weather_icons/43d.svg";
      case "heavysleetshowers_night":
        return "assets/weather_icons/43n.svg";
      case "heavysleetshowers_polartwilight":
        return "assets/weather_icons/43m.svg";
      case "lightsnowshowers_day":
        return "assets/weather_icons/44d.svg";
      case "lightsnowshowers_night":
        return "assets/weather_icons/44n.svg";
      case "lightsnowshowers_polartwilight":
        return "assets/weather_icons/44m.svg";
      case "heavysnowshowers_day":
        return "assets/weather_icons/45d.svg";
      case "heavysnowshowers_night":
        return "assets/weather_icons/45n.svg";
      case "heavysnowshowers_polartwilight":
        return "assets/weather_icons/45m.svg";
      case "lightrain":
        return "assets/weather_icons/46.svg";
      case "lightsleet":
        return "assets/weather_icons/47.svg";
      case "heavysleet":
        return "assets/weather_icons/48.svg";
      case "lightsnow":
        return "assets/weather_icons/49.svg";
      case "heavysnow":
        return "assets/weather_icons/50.svg";
      default:
        return "assets/weather_icons/01d.svg"; // default clear sky day icon
    }
  }
}
