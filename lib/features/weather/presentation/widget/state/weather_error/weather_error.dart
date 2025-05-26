import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: context.colors.error,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.errorLoadingWeather,
            style: context.text.titleLarge?.copyWith(
              color: context.colors.error,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: context.text.bodyMedium?.copyWith(
              color: context.colors.error,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
