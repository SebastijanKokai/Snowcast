import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../mountain_selector/presentation/bloc/mountain_state.dart';

class SnowNotificationService {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  final SharedPreferences _prefs;

  SnowNotificationService(this._prefs) {
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _notifications.initialize(initSettings);
  }

  Future<void> checkForSnowfall(Map<String, dynamic> weatherData) async {
    final selectedMountains = await _getSelectedMountains();
    if (selectedMountains.isEmpty) return;

    final mountainsWithSnow = <Mountain>[];

    for (final mountain in selectedMountains) {
      if (_hasSnowfall(weatherData, mountain)) {
        mountainsWithSnow.add(mountain);
      }
    }

    if (mountainsWithSnow.isNotEmpty) {
      await _showSnowNotification(mountainsWithSnow);
    }
  }

  bool _hasSnowfall(Map<String, dynamic> weatherData, Mountain mountain) {
    final timeseries = weatherData['properties']['timeseries'] as List;
    final now = DateTime.now();

    for (final data in timeseries) {
      final time = DateTime.parse(data['time'] as String);

      if (time.isBefore(now)) continue;

      final instant = data['data']['instant']['details'];
      final next1Hour = data['data']['next_1_hours'];

      final temperature = instant['air_temperature'] as double;
      if (temperature > 2.0) continue;

      final precipitation = next1Hour?['details']?['precipitation_amount'] as double? ?? 0.0;
      final symbol = next1Hour?['summary']?['symbol_code'] as String? ?? '';

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
    final jsonString = _prefs.getString('selected_mountains') ?? '{}';
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    return Mountain.values.where((mountain) => jsonMap[mountain.name] == true).toList();
  }
}
