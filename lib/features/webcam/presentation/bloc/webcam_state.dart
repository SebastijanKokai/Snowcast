import 'package:freezed_annotation/freezed_annotation.dart';

part 'webcam_state.freezed.dart';

enum WebcamStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
class WebcamState with _$WebcamState {
  factory WebcamState({
    @Default(WebcamStatus.initial) WebcamStatus status,
  }) = _WebcamState;
}
