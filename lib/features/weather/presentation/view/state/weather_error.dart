import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
