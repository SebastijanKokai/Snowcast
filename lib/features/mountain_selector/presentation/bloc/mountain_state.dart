import 'package:freezed_annotation/freezed_annotation.dart';

part 'mountain_state.freezed.dart';

enum Mountain {
  jahorina(
    "Jahorina",
    1916,
    43.7126,
    18.5691,
    'https://www.jahorina.org/info/webcam-jahorina.php',
  ),
  kopaonik(
    "Kopaonik",
    2017,
    43.2856,
    20.8222,
    'https://m.infokop.net/webcamlive.php',
  ),
  zlatibor(
    "Zlatibor",
    1496,
    43.7294,
    19.7044,
    'https://uzivokamere.com/zlatibor',
  ),
  bansko(
    "Bansko",
    2560,
    41.8389,
    23.4883,
    'https://www.banskoski.com/en/webcam/bansko',
  ),
  staraPlanina(
    "Stara Planina",
    1700,
    43.6333,
    22.3333,
    'https://www.skiresort.info/ski-resort/stara-planina-babin-zub/webcams/',
  ),
  valThorens(
    "Val Thorens",
    2300,
    45.2975,
    6.5803,
    'https://www.valthorens.com/en/webcams/',
  ),
  les2Alpes(
    "Les 2 Alpes",
    1650,
    45.0500,
    6.1200,
    'https://www.les2alpes.com/hiver/live/webcams/',
  ),
  cortinaAmpezzo(
    "Cortina d’Ampezzo",
    1224,
    46.5400,
    12.1333,
    'https://www.dolomitisuperski.com/en/Experience/Ski-areas/Cortina-d-Ampezzo/Webcam',
  );

  final String name;
  final int altitude;
  final double latitude;
  final double longitude;
  final String webcamUrl;

  const Mountain(
    this.name,
    this.altitude,
    this.latitude,
    this.longitude,
    this.webcamUrl,
  );
}

@freezed
class MountainState with _$MountainState {
  factory MountainState({
    @Default(Mountain.jahorina) Mountain selectedMountain,
  }) = _MountainState;
}
