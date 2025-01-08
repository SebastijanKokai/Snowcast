import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snowcast/core/navigation/app_bottom_nav_bar.dart';
import 'package:snowcast/features/mountain_selector/presentation/widget/mountain_selector.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MountainSelector(child: navigationShell),
      bottomNavigationBar: AppBottomNavBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
