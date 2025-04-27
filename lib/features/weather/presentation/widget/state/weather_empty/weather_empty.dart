import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off,
            size: 64,
            color: context.colors.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No weather data available',
            style: context.text.titleLarge?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
