import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:snowcast/core/di/injection_container.dart';
import 'package:snowcast/features/snow_notifications/data/repository/notification_repository.dart';
import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:snowcast/features/weather/domain/entity/weather.dart';
import 'package:workmanager/workmanager.dart';
import '../../../mountain_selector/presentation/bloc/mountain_state.dart';

class NotificationUsecase {
  static const String _checkSnowfallTask = 'checkSnowfallTask';

  final FlutterLocalNotificationsPlugin _notifications;
  final WeatherRepository _weatherRepository;
  final NotificationRepository _notificationRepository;
  final Workmanager _workmanager;

  NotificationUsecase({
    required FlutterLocalNotificationsPlugin notifications,
    required WeatherRepository weatherRepository,
    required NotificationRepository notificationRepository,
    required Workmanager workmanager,
  })  : _notifications = notifications,
        _weatherRepository = weatherRepository,
        _notificationRepository = notificationRepository,
        _workmanager = workmanager {
    _initializeNotifications();
    _initializeWorkmanager();
  }

  Future<Map<Mountain, bool>> getPreferences() async {
    return _notificationRepository.getPreferences();
  }

  Future<void> savePreferences(Map<Mountain, bool> preferences) async {
    return _notificationRepository.savePreferences(preferences);
  }

  Future<void> _initializeNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _notifications.initialize(initSettings);
  }

  void _initializeWorkmanager() {
    _workmanager.initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
  }

  Future<void> startBackgroundChecks() async {
    await _workmanager.registerPeriodicTask(
      _checkSnowfallTask,
      _checkSnowfallTask,
      frequency: const Duration(seconds: 5),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  Future<void> stopBackgroundChecks() async {
    await _workmanager.cancelByUniqueName(_checkSnowfallTask);
  }

  Future<void> checkForSnowfall(Weather weather) async {
    final selectedMountains = await _getSelectedMountains();
    if (selectedMountains.isEmpty) return;

    final mountainsWithSnow = <Mountain>[];

    for (final mountain in selectedMountains) {
      if (_hasSnowfall(weather, mountain)) {
        mountainsWithSnow.add(mountain);
      }
    }

    if (mountainsWithSnow.isNotEmpty) {
      await _showSnowNotification(mountainsWithSnow);
    }
  }

  bool _hasSnowfall(Weather weather, Mountain mountain) {
    final timeseries = weather.timeseries;
    final now = DateTime.now();

    for (final data in timeseries) {
      final time = DateTime.parse(data.time);

      if (time.isBefore(now)) continue;

      final instant = data.instant;

      final temperature = instant.airTemperature;
      if (temperature > 2.0) continue;

      final precipitation = instant.precipitationAmount;
      final symbol = instant.symbolCode;

      if (precipitation > 0.0 && (symbol.contains('snow') || symbol.contains('sleet'))) {
        return true;
      }
    }

    return false;
  }

  Future<void> _showSnowNotification(List<Mountain> mountains) async {
    final mountainNames = mountains.map((m) => m.name).join(', ');
    const title = 'Snow Alert!';
    final body = 'Snow is expected in: $mountainNames';

    const androidDetails = AndroidNotificationDetails(
      'snow_alerts',
      'Snow Alerts',
      channelDescription: 'Notifications about expected snowfall',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _notifications.show(
      0,
      title,
      body,
      details,
    );
  }

  Future<List<Mountain>> _getSelectedMountains() async {
    final jsonMap = await _notificationRepository.getPreferences();

    return Mountain.values.where((mountain) => jsonMap[mountain] == true).toList();
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == NotificationUsecase._checkSnowfallTask) {
      final usecase = getIt<NotificationUsecase>();
      final selectedMountains = await usecase._getSelectedMountains();

      for (final mountain in selectedMountains) {
        final weatherData = await usecase._weatherRepository.getWeather(
          lat: mountain.latitude.toString(),
          lon: mountain.longitude.toString(),
          alt: mountain.topAltitude.toString(),
        );
        await usecase.checkForSnowfall(weatherData);
      }
    }
    return true;
  });
}
