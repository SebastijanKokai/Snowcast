import 'package:snowcast/features/mountain_selector/data/dto/mountain_dto.dart';

class MountainProvider {
  List<MountainDto> getMountains() {
    return [
      const MountainDto(
        name: "Jahorina",
        topAltitude: 1916,
        bottomAltitude: 1300,
        latitude: 43.7126,
        longitude: 18.5691,
        webcamUrl: 'https://www.jahorina.org/info/webcam-jahorina.php',
      ),
      const MountainDto(
        name: "Kopaonik",
        topAltitude: 2017,
        bottomAltitude: 1070,
        latitude: 43.2856,
        longitude: 20.8222,
        webcamUrl: 'https://m.infokop.net/webcamlive.php',
      ),
      const MountainDto(
        name: "Zlatibor",
        topAltitude: 1496,
        bottomAltitude: 1000,
        latitude: 43.7294,
        longitude: 19.7044,
        webcamUrl: 'https://uzivokamere.com/zlatibor',
      ),
      const MountainDto(
        name: "Bansko",
        topAltitude: 2560,
        bottomAltitude: 990,
        latitude: 41.8389,
        longitude: 23.4883,
        webcamUrl: 'https://www.banskoski.com/en/webcam/bansko',
      ),
      const MountainDto(
        name: "Stara Planina",
        topAltitude: 1700,
        bottomAltitude: 1300,
        latitude: 43.6333,
        longitude: 22.3333,
        webcamUrl: 'https://www.skiresort.info/ski-resort/stara-planina-babin-zub/webcams/',
      ),
      const MountainDto(
        name: "Val Thorens",
        topAltitude: 3230,
        bottomAltitude: 1850,
        latitude: 45.2975,
        longitude: 6.5803,
        webcamUrl: 'https://www.valthorens.com/en/webcams/',
      ),
      const MountainDto(
        name: "Les 2 Alpes",
        topAltitude: 3600,
        bottomAltitude: 1650,
        latitude: 45.0500,
        longitude: 6.1200,
        webcamUrl: 'https://www.les2alpes.com/hiver/live/webcams/',
      ),
      const MountainDto(
        name: "Cortina d'Ampezzo",
        topAltitude: 2932,
        bottomAltitude: 1224,
        latitude: 46.5400,
        longitude: 12.1333,
        webcamUrl: 'https://www.dolomitisuperski.com/en/Experience/Ski-areas/Cortina-d-Ampezzo/Webcam',
      ),
    ];
  }

  MountainDto getMountainByName(String name) {
    return getMountains().firstWhere((mountain) => mountain.name == name);
  }
}
