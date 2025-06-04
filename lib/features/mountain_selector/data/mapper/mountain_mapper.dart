import 'package:snowcast/features/mountain_selector/data/dto/mountain_dto.dart';
import 'package:snowcast/features/mountain_selector/domain/entity/mountain_entity.dart';

extension MountainDtoMapper on MountainDto {
  MountainEntity toEntity() {
    return MountainEntity(
      id: id,
      name: name,
      topAltitude: topAltitude,
      bottomAltitude: bottomAltitude,
      latitude: latitude,
      longitude: longitude,
      webcamUrl: webcamUrl,
    );
  }
}

extension MountainEntityMapper on MountainEntity {
  MountainDto toDto() {
    return MountainDto(
      id: id,
      name: name,
      topAltitude: topAltitude,
      bottomAltitude: bottomAltitude,
      latitude: latitude,
      longitude: longitude,
      webcamUrl: webcamUrl,
    );
  }
}
