import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/app/app_config.dart';
import 'package:snowcast/core/router/router.dart';
import 'package:snowcast/features/localization/presentation/bloc/locale_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Snowcast',
          theme: AppConfig.theme,
          locale: state.locale,
          routerConfig: router,
          localizationsDelegates: AppConfig.localizationsDelegates,
          supportedLocales: AppConfig.supportedLocales,
        );
      },
    );
  }
}
