import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snowcast/core/theme/app_colors.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    required this.child,
    this.borderRadius = 24,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.blurSigma = 16,
    this.backgroundColor = AppColors.glassBackground,
    this.borderColor = AppColors.glassBorder,
    this.boxShadow = const [
      BoxShadow(
        color: AppColors.glassShadow,
        blurRadius: 12,
        offset: Offset(0, 4),
      ),
    ],
    super.key,
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final double blurSigma;
  final Color backgroundColor;
  final Color borderColor;
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor),
            boxShadow: boxShadow,
          ),
          child: child,
        ),
      ),
    );
  }
}
