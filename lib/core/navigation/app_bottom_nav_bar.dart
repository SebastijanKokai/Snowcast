import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../extensions/context_extensions.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      selectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      onTap: (index) {
        navigationShell.goBranch(index);
      },
      items: [
        getTab(
          label: l10n.weather,
          activeAsset: Icons.cloud,
          asset: Icons.cloud_outlined,
        ),
        getTab(
          label: l10n.webcam,
          activeAsset: Icons.camera,
          asset: Icons.camera_outlined,
        ),
        getTab(
          label: l10n.notifications,
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
