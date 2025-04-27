import 'package:go_router/go_router.dart';
import 'package:snowcast/core/navigation/scaffold_with_nav_bar.dart';
import 'package:snowcast/core/router/routes.dart';
import 'package:snowcast/features/snow_notifications/notifications_page.dart';
import 'package:snowcast/features/weather/presentation/page/weather_page.dart';
import 'package:snowcast/features/webcam/webcam_page.dart';

final router = GoRouter(initialLocation: AppRoute.weather.path, routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.weather.path,
              builder: (context, state) => const WeatherPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.webcam.path,
              builder: (context, state) => const WebcamPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.notifications.path,
              builder: (context, state) => const NotificationsPage(),
            ),
          ],
        ),
      ])
]);
