import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/webcam/presentation/bloc/webcam_state.dart';

class WebcamCubit extends Cubit<WebcamState> {
  WebcamCubit() : super(const WebcamState());

  void setLoading() {
    emit(state.copyWith(status: WebcamStatus.loading));
  }

  void setLoaded() {
    emit(state.copyWith(status: WebcamStatus.loaded));
  }
}
