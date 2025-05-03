import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/snow_notifications/data/provider/notification_provider.dart';

class NotificationRepository {
  NotificationRepository(this._provider);

  final NotificationProvider _provider;

  Future<Map<Mountain, bool>> getPreferences() async {
    return _provider.getPreferences();
  }

  Future<void> savePreferences(Map<Mountain, bool> preferences) async {
    return _provider.savePreferences(preferences);
  }
}
