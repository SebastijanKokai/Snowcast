import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MountainDto {
  const MountainDto({
    required this.id,
    required this.name,
    required this.topAltitude,
    required this.bottomAltitude,
    required this.latitude,
    required this.longitude,
    required this.webcamUrl,
  });

  final String id;
  final String name;
  final int topAltitude;
  final int bottomAltitude;
  final double latitude;
  final double longitude;
  final String webcamUrl;

  MountainDto copyWith({
    String? id,
    String? name,
    int? topAltitude,
    int? bottomAltitude,
    double? latitude,
    double? longitude,
    String? webcamUrl,
  }) =>
      MountainDto(
        id: id ?? this.id,
        name: name ?? this.name,
        topAltitude: topAltitude ?? this.topAltitude,
        bottomAltitude: bottomAltitude ?? this.bottomAltitude,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        webcamUrl: webcamUrl ?? this.webcamUrl,
      );
}
