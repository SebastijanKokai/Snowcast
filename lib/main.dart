import 'package:flutter/material.dart';
import 'package:snowcast/navigation/view/navigation_view.dart';

void main() {
  runApp(const MainWrapper());
}

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Navigation());
  }
}
