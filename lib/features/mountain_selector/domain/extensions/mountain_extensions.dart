import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

extension MountainX on Mountain {
  String getCameraUrl() {
    return switch (this) {
      Mountain.jahorina => 'https://www.jahorina.org/info/webcam-jahorina.php',
      Mountain.kopaonik => 'https://m.infokop.net/webcamlive.php',
      Mountain.zlatibor => 'https://uzivokamere.com/zlatibor',
      Mountain.bansko => 'https://www.banskoski.com/en/webcam/bansko',
    };
  }
}
