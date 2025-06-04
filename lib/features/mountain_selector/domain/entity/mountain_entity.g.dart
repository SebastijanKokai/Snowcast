// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MountainEntity _$MountainEntityFromJson(Map<String, dynamic> json) =>
    MountainEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      topAltitude: (json['topAltitude'] as num).toInt(),
      bottomAltitude: (json['bottomAltitude'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      webcamUrl: json['webcamUrl'] as String,
    );

Map<String, dynamic> _$MountainEntityToJson(MountainEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'topAltitude': instance.topAltitude,
      'bottomAltitude': instance.bottomAltitude,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'webcamUrl': instance.webcamUrl,
    };
