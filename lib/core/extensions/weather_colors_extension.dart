import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

extension WeatherColorsX on String {
  Color get backgroundColor {
    if (contains('thunder')) return AppColors.thunderBackground;
    if (contains('snow')) return AppColors.snowBackground;
    if (contains('rain') || contains('sleet')) return AppColors.rainBackground;
    if (contains('fog')) return AppColors.fogBackground;
    if (contains('cloudy') || contains('partlycloudy')) return AppColors.cloudyBackground;
    return AppColors.defaultBackground;
  }

  Color get textColor {
    if (contains('thunder')) return AppColors.thunderText;
    if (contains('snow')) return AppColors.snowText;
    if (contains('rain') || contains('sleet')) return AppColors.rainText;
    if (contains('fog')) return AppColors.fogText;
    if (contains('cloudy') || contains('partlycloudy')) return AppColors.cloudyText;
    return AppColors.defaultText;
  }
}
