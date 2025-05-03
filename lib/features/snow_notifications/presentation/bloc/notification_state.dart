import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  factory NotificationState({
    @Default({}) Map<Mountain, bool> selectedMountains,
    @Default('') String error,
  }) = _NotificationState;
}
