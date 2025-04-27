import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

part 'notification_preferences_state.freezed.dart';

@freezed
class NotificationPreferencesState with _$NotificationPreferencesState {
  factory NotificationPreferencesState({
    @Default({}) Map<Mountain, bool> selectedMountains,
  }) = _NotificationPreferencesState;
}
