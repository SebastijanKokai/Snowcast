import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

class NotificationState {
  const NotificationState({
    this.selectedMountains = const {},
    this.error = '',
  });

  final Map<Mountain, bool> selectedMountains;
  final String error;

  NotificationState copyWith({
    Map<Mountain, bool>? selectedMountains,
    String? error,
  }) =>
      NotificationState(selectedMountains: selectedMountains ?? this.selectedMountains, error: error ?? this.error);
}
