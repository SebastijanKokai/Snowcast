import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/mountain_selector/bloc/mountain_selector_state.dart';

class MountainSelectorCubit extends Cubit<MountainSelectorState> {
  MountainSelectorCubit() : super(MountainSelectorState());

  void setMountain(Mountain mountain) {
    emit(state.copyWith(selectedMountain: mountain));
  }
}
