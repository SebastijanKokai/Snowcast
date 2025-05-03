import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_state.dart';
import 'package:snowcast/features/snow_notifications/domain/usecase/notification_usecase.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationUsecase) : super(NotificationState()) {
    _loadPreferences();
  }

  late final NotificationUsecase _notificationUsecase;

  Future<void> _loadPreferences() async {
    try {
      final preferences = await _notificationUsecase.getPreferences();
      await _notificationUsecase.startBackgroundChecks();
      emit(NotificationState(selectedMountains: preferences));
    } catch (e) {
      emit(NotificationState());
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

  @override
  Future<void> close() async {
    await _notificationUsecase.stopBackgroundChecks();
    return super.close();
  }
}
