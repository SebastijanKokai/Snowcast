import 'package:snowcast/mountain_selector/bloc/mountain_selector_state.dart';

extension StringX on Mountain {
  (String, String, String) getCoordinates() {
    switch (this) {
      case Mountain.zlatibor:
        return ('43.6541', '19.64', '1496');
      case Mountain.jahorina:
        return ('43.7382', '18.5656', '1916');
      case Mountain.kopaonik:
        return ('43.2862', '20.8092', '1770');
      case Mountain.unknown:
        return ('0', '0', '0');
    }
  }
}
