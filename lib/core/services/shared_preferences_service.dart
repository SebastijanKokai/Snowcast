import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._(this._preferences);

  static SharedPreferencesService? _instance;
  final SharedPreferences _preferences;

  factory SharedPreferencesService.create(SharedPreferences prefs) {
    _instance ??= SharedPreferencesService._(prefs);
    return _instance!;
  }

  Future<bool> setString(String key, String value) async {
    return _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }
}
