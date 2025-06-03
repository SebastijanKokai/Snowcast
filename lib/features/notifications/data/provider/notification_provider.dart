import 'dart:convert';
import 'package:snowcast/core/services/shared_preferences_service.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

class NotificationProvider {
  NotificationProvider(this._preferencesService);

  static const _preferencesKey = 'notification_preferences';
  final SharedPreferencesService _preferencesService;

  Future<Map<Mountain, bool>> getPreferences() async {
    final jsonString = _preferencesService.getString(_preferencesKey);

    if (jsonString == null) {
      return {};
    }

    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map(
      (key, value) => MapEntry(
        Mountain.values.firstWhere((m) => m.name == key),
        value as bool,
      ),
    );
  }

  Future<void> savePreferences(Map<Mountain, bool> preferences) async {
    final jsonMap = preferences.map(
      (key, value) => MapEntry(key.name, value),
    );
    await _preferencesService.setString(_preferencesKey, json.encode(jsonMap));
  }

  Future<void> clearPreferences() async {
    await _preferencesService.remove(_preferencesKey);
  }
}
