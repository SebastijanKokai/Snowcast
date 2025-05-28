import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
    this.isTemperature = false,
    this.maxValue = '',
    this.minValue = '',
    this.tempUnit = '',
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color textColor;
  final bool isTemperature;
  final String maxValue;
  final String minValue;
  final String tempUnit;

  @override
  Widget build(BuildContext context) {
    return _WeatherDetailContainer(
      color: textColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _WeatherDetailIcon(icon: icon, color: textColor),
          const SizedBox(height: 10),
          _WeatherDetailLabel(label: label, color: textColor),
          const SizedBox(height: 6),
          _WeatherDetailValue(
            isTemperature: isTemperature,
            maxValue: maxValue,
            minValue: minValue,
            tempUnit: tempUnit,
            value: value,
            color: textColor,
          ),
        ],
      ),
    );
  }
}

class _WeatherDetailContainer extends StatelessWidget {
  const _WeatherDetailContainer({required this.child, required this.color});
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.55),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.18)),
      ),
      child: child,
    );
  }
}

class _WeatherDetailIcon extends StatelessWidget {
  const _WeatherDetailIcon({required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.18),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 22, color: color),
    );
  }
}

class _WeatherDetailLabel extends StatelessWidget {
  const _WeatherDetailLabel({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: context.text.labelSmall?.copyWith(color: const Color.fromRGBO(0, 0, 0, 0.85)),
    );
  }
}

class _WeatherDetailValue extends StatelessWidget {
  const _WeatherDetailValue({
    required this.isTemperature,
    required this.maxValue,
    required this.minValue,
    required this.tempUnit,
    required this.value,
    required this.color,
  });
  final bool isTemperature;
  final String maxValue;
  final String minValue;
  final String tempUnit;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (isTemperature) {
      return _WeatherTemperatureValue(
        maxValue: maxValue,
        minValue: minValue,
        tempUnit: tempUnit,
        color: color,
        textStyle: context.text.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else {
      return Text(
        value,
        textAlign: TextAlign.center,
        style: context.text.titleMedium?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    }
  }
}

class _WeatherTemperatureValue extends StatelessWidget {
  const _WeatherTemperatureValue({
    required this.maxValue,
    required this.minValue,
    required this.tempUnit,
    required this.color,
    required this.textStyle,
  });
  final String maxValue;
  final String minValue;
  final String tempUnit;
  final Color color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('↑', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 4),
            Text('$maxValue$tempUnit', style: textStyle?.copyWith(color: color)),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('↓', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 4),
            Text('$minValue$tempUnit', style: textStyle?.copyWith(color: color)),
          ],
        ),
      ],
    );
  }
}
