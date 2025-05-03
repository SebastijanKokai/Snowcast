import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:snowcast/features/snow_notifications/data/repository/notification_repository.dart';
import 'package:snowcast/features/snow_notifications/domain/usecase/notification_usecase.dart';
import 'package:snowcast/features/weather/data/dto/extension_dto.dart';
import 'package:snowcast/features/weather/data/dto/weather_dto.dart';
import 'package:snowcast/features/weather/data/repository/weather_repository.dart';
import 'package:workmanager/workmanager.dart';

import 'snow_notification_service_test.mocks.dart';

@GenerateMocks([
  FlutterLocalNotificationsPlugin,
  NotificationRepository,
  WeatherRepository,
  Workmanager,
])
void main() {
  late NotificationUsecase service;
  late MockFlutterLocalNotificationsPlugin mockNotifications;
  late MockNotificationRepository mockNotificationRepository;
  late MockWorkmanager mockWorkmanager;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockNotifications = MockFlutterLocalNotificationsPlugin();
    mockWorkmanager = MockWorkmanager();
    mockWeatherRepository = MockWeatherRepository();
    mockNotificationRepository = MockNotificationRepository();
    when(mockNotifications.initialize(any)).thenAnswer((_) async => true);
    when(mockNotifications.show(any, any, any, any)).thenAnswer((_) async => true);
    service = NotificationUsecase(
        notifications: mockNotifications,
        weatherRepository: mockWeatherRepository,
        notificationRepository: mockNotificationRepository,
        workmanager: mockWorkmanager);
  });

  group('SnowNotificationService', () {
    test('should not show notification when no mountains are selected', () async {
      when(mockNotificationRepository.getPreferences()).thenAnswer((_) async => {});
      final weather = WeatherDto.fromJson(mockWeatherData).toEntity;

      await service.checkForSnowfall(weather);

      verifyNever(mockNotifications.show(any, any, any, any));
    });

    // test('should detect snowfall for selected mountain', () async {
    //   when(mockNotificationRepository.getPreferences()).thenAnswer((_) async => {Mountain.jahorina: true});

    //   final weather = WeatherDto.fromJson(mockWeatherDataWithSnowfall).toEntity;
    //   await service.checkForSnowfall(weather);

    //   verify(mockNotifications.show(any, any, any, any)).called(1);
    // });

    test('should not detect snowfall when temperature is too high', () async {
      when(mockNotificationRepository.getPreferences()).thenAnswer((_) async => {});
      final highTempData = Map<String, dynamic>.from(mockWeatherData);
      highTempData['properties']['timeseries'][0]['data']['instant']['details']['air_temperature'] = 5.0;
      final weather = WeatherDto.fromJson(highTempData).toEntity;

      await service.checkForSnowfall(weather);

      verifyNever(mockNotifications.show(any, any, any, any));
    });
  });
}

final mockWeatherData = {
  "type": "Feature",
  "properties": {
    "timeseries": [
      {
        "time": DateTime.now().toIso8601String(),
        "data": {
          "instant": {
            "details": {
              "air_temperature": 1.0,
            }
          },
          "next_1_hours": {
            "summary": {"symbol_code": "light_snow"},
            "details": {"precipitation_amount": 0.5}
          }
        }
      }
    ]
  }
};

final mockWeatherDataWithSnowfall = {
  "type": "Feature",
  "properties": {
    "timeseries": [
      {
        "time": DateTime.now().toIso8601String(),
        "data": {
          "instant": {
            "details": {
              "air_temperature": -2.0,
            }
          },
          "next_1_hours": {
            "summary": {"symbol_code": "heavy_snow"},
            "details": {"precipitation_amount": 2.0}
          }
        }
      },
      {
        "time": DateTime.now().add(const Duration(hours: 1)).toIso8601String(),
        "data": {
          "instant": {
            "details": {
              "air_temperature": -1.5,
            }
          },
          "next_1_hours": {
            "summary": {"symbol_code": "light_snow"},
            "details": {"precipitation_amount": 0.8}
          }
        }
      },
      {
        "time": DateTime.now().add(const Duration(hours: 2)).toIso8601String(),
        "data": {
          "instant": {
            "details": {
              "air_temperature": -1.0,
            }
          },
          "next_1_hours": {
            "summary": {"symbol_code": "sleet"},
            "details": {"precipitation_amount": 1.2}
          }
        }
      }
    ]
  }
};
