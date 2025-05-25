import 'package:flutter/material.dart';
import 'package:snowcast/core/services/shared_preferences_service.dart';
import '../../domain/repositories/locale_repository.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final SharedPreferencesService _prefs;
  static const String _localeKey = 'locale';

  LocaleRepositoryImpl(this._prefs);

  @override
  Future<Locale> getLocale() async {
    final String? languageCode = _prefs.getString(_localeKey);
    return languageCode != null ? Locale(languageCode) : const Locale('en');
  }

  @override
  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
  }
}
