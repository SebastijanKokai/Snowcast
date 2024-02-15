abstract class NavigationEvent {}

class TabChange extends NavigationEvent {
  TabChange({required this.tabIndex});

  final int tabIndex;
}
