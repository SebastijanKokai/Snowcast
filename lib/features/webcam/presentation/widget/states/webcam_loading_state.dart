import 'package:flutter/material.dart';

class WebcamLoadingState extends StatelessWidget {
  const WebcamLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
