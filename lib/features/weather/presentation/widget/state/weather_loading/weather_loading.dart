import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: context.colors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.loadingWeather,
            style: context.text.titleLarge?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
