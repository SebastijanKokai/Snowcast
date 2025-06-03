import 'package:snowcast/features/mountain_selector/data/mapper/mountain_mapper.dart';
import 'package:snowcast/features/mountain_selector/data/provider/mountain_provider.dart';
import 'package:snowcast/features/mountain_selector/domain/entity/mountain_entity.dart';

class MountainRepository {
  MountainRepository(this._provider);

  final MountainProvider _provider;

  List<MountainEntity> getMountains() {
    return _provider.getMountains().map((dto) => dto.toEntity()).toList();
  }

  MountainEntity getMountainByName(String name) {
    return _provider.getMountainByName(name).toEntity();
  }
}
