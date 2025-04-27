import 'package:flutter/material.dart';

extension TextThemeX on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}

extension MediaQueryX on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
}

extension BorderX on BuildContext {
  OutlineInputBorder get defaultBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors.outline,
        ),
      );

  OutlineInputBorder get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors.primary,
          width: 2,
        ),
      );
}
