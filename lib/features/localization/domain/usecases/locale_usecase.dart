import 'package:flutter/material.dart';
import '../repositories/locale_repository.dart';

class LocaleUsecase {
  final LocaleRepository _repository;

  LocaleUsecase(this._repository);

  Future<Locale> getLocale() => _repository.getLocale();
  Future<void> setLocale(Locale locale) => _repository.setLocale(locale);
}
