import 'package:snowcast/features/mountain_selector/domain/entity/mountain_entity.dart';

enum Mountain {
  jahorina(
    "Jahorina",
    1916,
    1300,
    43.7126,
    18.5691,
    'https://www.jahorina.org/info/webcam-jahorina.php',
  ),
  kopaonik(
    "Kopaonik",
    2017,
    1070,
    43.2856,
    20.8222,
    'https://m.infokop.net/webcamlive.php',
  ),
  zlatibor(
    "Zlatibor",
    1496,
    1000,
    43.7294,
    19.7044,
    'https://uzivokamere.com/zlatibor',
  ),
  bansko(
    "Bansko",
    2560,
    990,
    41.8389,
    23.4883,
    'https://www.banskoski.com/en/webcam/bansko',
  ),
  staraPlanina(
    "Stara Planina",
    1700,
    1300,
    43.6333,
    22.3333,
    'https://www.skiresort.info/ski-resort/stara-planina-babin-zub/webcams/',
  ),
  valThorens(
    "Val Thorens",
    3230,
    1850,
    45.2975,
    6.5803,
    'https://www.valthorens.com/en/webcams/',
  ),
  les2Alpes(
    "Les 2 Alpes",
    3600,
    1650,
    45.0500,
    6.1200,
    'https://www.les2alpes.com/hiver/live/webcams/',
  ),
  cortinaAmpezzo(
    "Cortina d'Ampezzo",
    2932,
    1224,
    46.5400,
    12.1333,
    'https://www.dolomitisuperski.com/en/Experience/Ski-areas/Cortina-d-Ampezzo/Webcam',
  );

  final String name;
  final int topAltitude;
  final int bottomAltitude;
  final double latitude;
  final double longitude;
  final String webcamUrl;

  const Mountain(
    this.name,
    this.topAltitude,
    this.bottomAltitude,
    this.latitude,
    this.longitude,
    this.webcamUrl,
  );
}

class MountainState {
  MountainState({
    this.mountains = const [],
    this.selectedMountain,
  });

  final List<MountainEntity> mountains;
  final MountainEntity? selectedMountain;

  MountainState copyWith({
    List<MountainEntity>? mountains,
    MountainEntity? selectedMountain,
  }) =>
      MountainState(
        mountains: mountains ?? this.mountains,
        selectedMountain: selectedMountain ?? this.selectedMountain,
      );
}
