import 'package:get_it/get_it.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snowcast/core/services/shared_preferences_service.dart';
import 'package:snowcast/features/snow_notifications/data/provider/notification_provider.dart';
import 'package:snowcast/features/snow_notifications/data/repository/notification_repository.dart';
import 'package:snowcast/features/snow_notifications/domain/usecase/notification_usecase.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_cubit.dart';
import 'package:snowcast/features/weather/data/provider/remote_weather_provider.dart';
import 'package:snowcast/features/weather/data/provider/weather_provider.dart';
import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:snowcast/features/weather/domain/usecase/weather_usecase.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeSharedPreferences();
  await initializeWeatherDependencies();
  await initializeNotificationDependencies();
}

Future<void> initializeSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService.create(prefs),
  );
}

Future<void> initializeWeatherDependencies() async {
  getIt.registerLazySingleton<WeatherProvider>(
    () => RemoteWeatherProvider(),
  );
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepository(weatherProvider: getIt()),
  );
  getIt.registerLazySingleton<WeatherUsecase>(
    () => WeatherUsecase(weatherRepository: getIt()),
  );
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(getIt()),
  );
}

Future<void> initializeNotificationDependencies() async {
  getIt.registerLazySingleton<NotificationProvider>(
    () => NotificationProvider(getIt()),
  );

  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepository(getIt()),
  );

  getIt.registerLazySingleton<NotificationUsecase>(
    () => NotificationUsecase(
      notifications: FlutterLocalNotificationsPlugin(),
      weatherRepository: getIt(),
      notificationRepository: getIt(),
    ),
  );

  getIt.registerFactory<NotificationCubit>(
    () => NotificationCubit(getIt()),
  );
}
