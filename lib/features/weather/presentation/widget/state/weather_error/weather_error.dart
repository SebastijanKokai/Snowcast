import 'package:flutter/material.dart';
import 'package:snowcast/core/error/weather_error_code.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({
    required this.errorCode,
    this.onRetry,
    super.key,
  });

  final AppErrorCode errorCode;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _ErrorContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _ErrorIcon(),
            const SizedBox(height: 24),
            _ErrorTitle(text: context.l10n.errorLoadingWeather),
            const SizedBox(height: 12),
            _ErrorMessage(text: errorCode.getLocalizedMessage(context)),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              _RetryButton(onRetry: onRetry!),
            ],
          ],
        ),
      ),
    );
  }
}

class _ErrorContainer extends StatelessWidget {
  const _ErrorContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surface.withAlpha(230),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.colors.shadow.withAlpha(25),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ErrorIcon extends StatelessWidget {
  const _ErrorIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.errorContainer.withAlpha(230),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.error_outline_rounded,
        size: 48,
        color: context.colors.error,
      ),
    );
  }
}

class _ErrorTitle extends StatelessWidget {
  const _ErrorTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.text.titleLarge?.copyWith(
        color: context.colors.error,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.text.bodyMedium?.copyWith(
        color: context.colors.onSurfaceVariant,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _RetryButton extends StatelessWidget {
  const _RetryButton({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onRetry,
      icon: const Icon(Icons.refresh_rounded),
      label: Text(context.l10n.retry),
    );
  }
}
