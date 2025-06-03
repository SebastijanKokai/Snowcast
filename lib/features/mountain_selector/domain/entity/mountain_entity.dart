import 'package:json_annotation/json_annotation.dart';

part 'mountain_entity.g.dart';

@JsonSerializable()
class MountainEntity {
  const MountainEntity({
    required this.name,
    required this.topAltitude,
    required this.bottomAltitude,
    required this.latitude,
    required this.longitude,
    required this.webcamUrl,
  });

  final String name;
  final int topAltitude;
  final int bottomAltitude;
  final double latitude;
  final double longitude;
  final String webcamUrl;

  MountainEntity copyWith({
    String? name,
    int? topAltitude,
    int? bottomAltitude,
    double? latitude,
    double? longitude,
    String? webcamUrl,
  }) =>
      MountainEntity(
          name: name ?? this.name,
          topAltitude: topAltitude ?? this.topAltitude,
          bottomAltitude: bottomAltitude ?? this.bottomAltitude,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude,
          webcamUrl: webcamUrl ?? this.webcamUrl);

  factory MountainEntity.fromJson(Map<String, dynamic> json) => _$MountainEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MountainEntityToJson(this);
}
