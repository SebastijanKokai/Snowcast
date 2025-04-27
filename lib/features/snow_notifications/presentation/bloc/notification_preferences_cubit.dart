import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_preferences_state.dart';

class NotificationPreferencesCubit extends Cubit<NotificationPreferencesState> {
  NotificationPreferencesCubit() : super(NotificationPreferencesState());

  void toggleMountain(Mountain mountain) {
    final currentSelection = state.selectedMountains[mountain] ?? false;
    final updatedSelection = Map<Mountain, bool>.from(state.selectedMountains)..[mountain] = !currentSelection;

    emit(state.copyWith(selectedMountains: updatedSelection));
  }
}
