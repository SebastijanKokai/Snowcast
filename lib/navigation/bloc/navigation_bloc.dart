import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/navigation/bloc/navigation_event.dart';
import 'package:snowcast/navigation/bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(tabIndex: 0)) {
    on<TabChange>(
      (event, emit) {
        emit(NavigationState(tabIndex: event.tabIndex));
      },
    );
  }
}
