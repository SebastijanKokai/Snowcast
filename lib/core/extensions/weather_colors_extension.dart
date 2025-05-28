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

  LinearGradient get weatherGradient {
    if (contains('thunder')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.thunderGradientTop, AppColors.thunderGradientBottom],
      );
    }
    if (contains('snow')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.snowGradientTop, AppColors.snowGradientBottom],
      );
    }
    if (contains('rain') || contains('sleet')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.rainGradientTop, AppColors.rainGradientBottom],
      );
    }
    if (contains('fog')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.cloudyGradientTop, AppColors.cloudyGradientBottom],
      );
    }
    if (contains('cloudy') || contains('partlycloudy')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.cloudyGradientTop, AppColors.cloudyGradientBottom],
      );
    }
    // Default: clear
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.clearGradientTop, AppColors.clearGradientBottom],
    );
  }
}
