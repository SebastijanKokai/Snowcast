import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      selectedFontSize: 12,
      onTap: (index) {
        navigationShell.goBranch(index);
      },
      items: [
        getTab(
          label: 'Weather',
          activeAsset: Icons.cloud,
          asset: Icons.cloud_outlined,
        ),
        getTab(
          label: 'Webcam',
          activeAsset: Icons.camera,
          asset: Icons.camera_outlined,
        ),
        getTab(
          label: 'Notifications',
          activeAsset: Icons.notifications,
          asset: Icons.notifications_outlined,
        ),
      ],
    );
  }
}

BottomNavigationBarItem getTab({
  required String label,
  required IconData asset,
  required IconData activeAsset,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: _MenuItem(
      asset: asset,
    ),
    activeIcon: _MenuItem(
      asset: activeAsset,
    ),
  );
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.asset,
  });

  final IconData asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: Icon(asset),
    );
  }
}
