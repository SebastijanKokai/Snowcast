import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class AnimatedWeatherIcon extends StatefulWidget {
  const AnimatedWeatherIcon({super.key});

  @override
  State<AnimatedWeatherIcon> createState() => _AnimatedWeatherIconState();
}

class _AnimatedWeatherIconState extends State<AnimatedWeatherIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_floatAnimation.value),
          child: Icon(
            Icons.cloud,
            size: 80,
            color: context.colors.primary.withAlpha(204),
          ),
        );
      },
    );
  }
}
