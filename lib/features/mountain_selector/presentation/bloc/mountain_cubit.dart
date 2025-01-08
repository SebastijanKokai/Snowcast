import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/domain/extensions/mountain_extensions.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

class MountainCubit extends Cubit<MountainState> {
  MountainCubit() : super(MountainState());

  void setMountain(String mountainString) {
    try {
      final mountain =
          Mountain.values.firstWhere((item) => item.name == mountainString);

      emit(
        state.copyWith(
          selectedMountain: mountain,
          webcamUrl: mountain.getCameraUrl(),
        ),
      );
    } catch (e) {
      // Do nothing
    }
  }
}
