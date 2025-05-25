enum AppRoute {
  weather('/', 'weather'),
  webcam('/webcam', 'webcam'),
  notifications('/notifications', 'notifications'),
  settings('/settings', 'settings');

  const AppRoute(this.path, this.name);

  final String path;
  final String name;
}
