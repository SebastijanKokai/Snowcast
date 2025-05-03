import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snowcast/core/services/shared_preferences_service.dart';
import 'package:snowcast/features/snow_notifications/data/provider/notification_provider.dart';
import 'package:snowcast/features/snow_notifications/data/repository/notification_repository.dart';
import 'package:snowcast/features/weather/data/provider/remote_weather_provider.dart';
import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:snowcast/features/snow_notifications/domain/usecase/notification_usecase.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

class WorkmanagerService {
  static const String _checkSnowfallTask = 'checkSnowfallTask';

  static Future<void> initialize() async {
    final workmanager = Workmanager();
    workmanager.initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
  }

  @pragma('vm:entry-point')
  static void callbackDispatcher() {
    Workmanager().executeTask((taskName, inputData) async {
      if (taskName == _checkSnowfallTask) {
        final notifications = FlutterLocalNotificationsPlugin();
        await notifications.initialize(
          const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings(),
          ),
        );

        final prefs = await SharedPreferences.getInstance();
        final sharedPrefsService = SharedPreferencesService.create(prefs);
        final notificationProvider = NotificationProvider(sharedPrefsService);
        final notificationRepository = NotificationRepository(notificationProvider);
        final weatherProvider = RemoteWeatherProvider();
        final weatherRepository = WeatherRepository(weatherProvider: weatherProvider);

        final usecase = NotificationUsecase(
          weatherRepository: weatherRepository,
          notificationRepository: notificationRepository,
          workmanager: Workmanager(),
          notifications: notifications,
        );

        final selectedMountains = await usecase.getSelectedMountains();

        for (final mountain in selectedMountains) {
          final weatherData = await usecase.getWeather(mountain);
          await usecase.checkForSnowfall(weatherData);
        }
      }
      return true;
    });
  }
}
