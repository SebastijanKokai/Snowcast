import 'package:get_it/get_it.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snowcast/core/theme/gradient_cubit/gradient_cubit.dart';
import 'package:snowcast/features/mountain_selector/data/provider/mountain_provider.dart';
import 'package:snowcast/features/mountain_selector/data/repository/mountain_repository.dart';
import 'package:snowcast/features/mountain_selector/domain/usecase/mountain_usecase.dart';
import 'package:workmanager/workmanager.dart';
import 'package:snowcast/core/services/shared_preferences_service.dart';
import 'package:snowcast/core/services/workmanager_service.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/notifications/data/provider/notification_provider.dart';
import 'package:snowcast/features/notifications/data/repository/notification_repository.dart';
import 'package:snowcast/features/notifications/domain/usecase/notification_usecase.dart';
import 'package:snowcast/features/notifications/presentation/bloc/notification_cubit.dart';
import 'package:snowcast/features/weather/data/provider/remote_weather_provider.dart';
import 'package:snowcast/features/weather/data/provider/weather_provider.dart';
import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:snowcast/features/weather/domain/usecase/weather_usecase.dart';
import 'package:snowcast/features/weather/presentation/bloc/weather_cubit.dart';
import '../../features/localization/data/repositories/locale_repository_impl.dart';
import '../../features/localization/domain/repositories/locale_repository.dart';
import '../../features/localization/domain/usecases/locale_usecase.dart';
import '../../features/localization/presentation/bloc/locale_cubit.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeLocalizationDependencies();
  await initializeGradientCubit();
  await initializeMountainSelectorDependencies();
  await initializeSharedPreferences();
  await initializeFlutterLocalNotifications();
  await initializeWorkmanager();
  await initializeWeatherDependencies();
  await initializeNotificationDependencies();
}

Future<void> initializeGradientCubit() async {
  getIt.registerLazySingleton<GradientCubit>(() => GradientCubit());
}

Future<void> initializeSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService.create(prefs),
  );
}

Future<void> initializeFlutterLocalNotifications() async {
  final notifications = FlutterLocalNotificationsPlugin();
  const androidSettings = AndroidInitializationSettings('logo_notification');
  const iosSettings = DarwinInitializationSettings();
  const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);

  await notifications.initialize(initSettings);
  getIt.registerLazySingleton<FlutterLocalNotificationsPlugin>(() => notifications);
}

Future<void> initializeWorkmanager() async {
  await initializeWorkManager();
  getIt.registerLazySingleton<Workmanager>(() => Workmanager());
}

Future<void> initializeMountainSelectorDependencies() async {
  getIt
    ..registerLazySingleton<MountainProvider>(() => MountainProvider())
    ..registerLazySingleton<MountainRepository>(() => MountainRepository(getIt()))
    ..registerLazySingleton<MountainUsecase>(() => MountainUsecase(getIt()))
    ..registerFactory<MountainCubit>(() => MountainCubit(getIt()));
}

Future<void> initializeWeatherDependencies() async {
  getIt
    ..registerLazySingleton<WeatherProvider>(() => RemoteWeatherProvider())
    ..registerLazySingleton<WeatherRepository>(() => WeatherRepository(weatherProvider: getIt()))
    ..registerLazySingleton<WeatherUsecase>(() => WeatherUsecase(weatherRepository: getIt()))
    ..registerFactory<WeatherCubit>(() => WeatherCubit(getIt()));
}

Future<void> initializeNotificationDependencies() async {
  getIt
    ..registerLazySingleton<NotificationProvider>(() => NotificationProvider(getIt()))
    ..registerLazySingleton<NotificationRepository>(() => NotificationRepository(getIt()))
    ..registerLazySingleton<NotificationUsecase>(() => NotificationUsecase(
          notifications: getIt(),
          weatherRepository: getIt(),
          notificationRepository: getIt(),
          workmanager: getIt(),
        ))
    ..registerFactory<NotificationCubit>(() => NotificationCubit(getIt()));
}

Future<void> initializeLocalizationDependencies() async {
  getIt
    ..registerLazySingleton<LocaleRepository>(() => LocaleRepositoryImpl(getIt()))
    ..registerLazySingleton(() => LocaleUsecase(getIt()))
    ..registerFactory(() => LocaleCubit(getIt()));
}
