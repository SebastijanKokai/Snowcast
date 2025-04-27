import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class WebcamErrorState extends StatelessWidget {
  const WebcamErrorState({
    required this.onRetry,
    super.key,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: context.colors.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error Loading Webcam',
                style: context.text.titleMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Could not load the webcam feed. Please try again later.',
                style: context.text.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
