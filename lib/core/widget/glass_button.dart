import 'package:flutter/material.dart';
import 'glass_container.dart';
import 'package:snowcast/core/theme/app_colors.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.borderRadius = 16,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.foregroundColor,
    this.borderColor,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color? foregroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: borderRadius,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: foregroundColor ?? AppColors.defaultText,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor ?? AppColors.glassBorder),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1,
              ),
        ),
      ),
    );
  }
}
