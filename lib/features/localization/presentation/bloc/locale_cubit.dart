import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/locale_usecase.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final LocaleUsecase _localeUsecase;

  LocaleCubit(this._localeUsecase) : super(const LocaleState(locale: Locale('en'))) {
    _init();
  }

  Future<void> _init() async {
    final locale = await _localeUsecase.getLocale();
    emit(LocaleState(locale: locale));
  }

  Future<void> setLocale(Locale locale) async {
    await _localeUsecase.setLocale(locale);
    emit(LocaleState(locale: locale));
  }
}
