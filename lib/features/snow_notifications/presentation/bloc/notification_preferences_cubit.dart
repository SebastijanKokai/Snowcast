import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/snow_notifications/data/repository/notification_preferences_repository.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_preferences_state.dart';

class NotificationPreferencesCubit extends Cubit<NotificationPreferencesState> {
  NotificationPreferencesCubit(this._repository) : super(NotificationPreferencesState()) {
    _loadPreferences();
  }

  final NotificationPreferencesRepository _repository;

  Future<void> _loadPreferences() async {
    try {
      final preferences = await _repository.getPreferences();
      emit(NotificationPreferencesState(selectedMountains: preferences));
    } catch (e) {
      emit(NotificationPreferencesState());
    }
  }

  Future<void> toggleMountain(Mountain mountain) async {
    try {
      final currentSelection = state.selectedMountains[mountain] ?? false;
      final updatedSelection = Map<Mountain, bool>.from(state.selectedMountains)..[mountain] = !currentSelection;

      await _repository.savePreferences(updatedSelection);
      emit(state.copyWith(selectedMountains: updatedSelection, error: ''));
    } catch (e) {
      emit(state.copyWith(error: 'There was an issue saving your preferences. Please try again.'));
    }
  }
}
