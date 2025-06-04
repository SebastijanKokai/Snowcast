import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/domain/usecase/mountain_usecase.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

class MountainCubit extends Cubit<MountainState> {
  MountainCubit(this._mountainUsecase) : super(MountainState()) {
    _init();
  }

  final MountainUsecase _mountainUsecase;

  void _init() {
    try {
      final mountains = _mountainUsecase.getMountains();
      final mountain = _mountainUsecase.getMountainById('1');
      emit(state.copyWith(mountains: mountains, selectedMountain: mountain));
    } catch (e) {
      // Do nothing
    }
  }

  void setMountain(String id) {
    try {
      final mountain = _mountainUsecase.getMountainById(id);
      emit(state.copyWith(selectedMountain: mountain));
    } catch (e) {
      // Do nothing
    }
  }
}
