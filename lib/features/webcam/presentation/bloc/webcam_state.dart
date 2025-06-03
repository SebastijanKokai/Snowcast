enum WebcamStatus {
  initial,
  loading,
  loaded,
}

class WebcamState {
  const WebcamState({
    this.status = WebcamStatus.initial,
  });

  final WebcamStatus status;

  WebcamState copyWith({
    WebcamStatus? status,
  }) =>
      WebcamState(status: status ?? this.status);
}
