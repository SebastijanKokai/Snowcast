import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: context.colors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading weather data...',
            style: context.text.titleLarge?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
