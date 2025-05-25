import 'package:flutter/material.dart';

abstract class LocaleRepository {
  Future<Locale> getLocale();
  Future<void> setLocale(Locale locale);
}
