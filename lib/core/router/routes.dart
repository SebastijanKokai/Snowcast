enum AppRoute {
  weather('/'),
  webcam('/webcam'),
  notifications('/notifications');

  const AppRoute(this.path);

  final String path;
}
