import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/notifications/presentation/bloc/notification_state.dart';
import 'package:snowcast/features/notifications/domain/usecase/notification_usecase.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationUsecase) : super(const NotificationState()) {
    _loadPreferences();
  }

  late final NotificationUsecase _notificationUsecase;

  Future<void> _loadPreferences() async {
    try {
      final preferences = await _notificationUsecase.getPreferences();
      await _notificationUsecase.startBackgroundChecks();
      emit(NotificationState(selectedMountains: preferences));
    } catch (e) {
      emit(const NotificationState());
    }
  }

  Future<void> toggleMountain(Mountain mountain) async {
    try {
      final currentSelection = state.selectedMountains[mountain] ?? false;
      final updatedSelection = Map<Mountain, bool>.from(state.selectedMountains)..[mountain] = !currentSelection;

      await _notificationUsecase.savePreferences(updatedSelection);
      emit(state.copyWith(selectedMountains: updatedSelection, error: ''));
    } catch (e) {
      emit(state.copyWith(error: 'There was an issue saving your preferences. Please try again.'));
    }
  }

  Future<void> stopBackgroundChecks() async {
    await _notificationUsecase.stopBackgroundChecks();
    await _notificationUsecase.clearPreferences();
    emit(state.copyWith(selectedMountains: {}, error: ''));
  }
}
