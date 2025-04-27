import 'package:flutter/material.dart';

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
