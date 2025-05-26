import 'package:go_router/go_router.dart';
import 'package:snowcast/core/navigation/scaffold_with_nav_bar.dart';
import 'package:snowcast/core/router/routes.dart';
import 'package:snowcast/features/snow_notifications/presentation/page/notification_page.dart';
import 'package:snowcast/features/weather/presentation/page/weather_page.dart';
import 'package:snowcast/features/webcam/presentation/page/webcam_page.dart';

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
              name: AppRoute.weather.name,
              builder: (context, state) => const WeatherPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.webcam.path,
              name: AppRoute.webcam.name,
              builder: (context, state) => const WebcamPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.notifications.path,
              name: AppRoute.notifications.name,
              builder: (context, state) => const NotificationPage(),
            ),
          ],
        ),
      ])
]);
