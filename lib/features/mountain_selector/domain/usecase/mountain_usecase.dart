import 'package:snowcast/features/mountain_selector/data/repository/mountain_repository.dart';
import 'package:snowcast/features/mountain_selector/domain/entity/mountain_entity.dart';

class MountainUsecase {
  MountainUsecase(this._repository);

  final MountainRepository _repository;

  List<MountainEntity> getMountains() {
    return _repository.getMountains();
  }

  MountainEntity getMountainByName(String name) {
    return _repository.getMountainByName(name);
  }
}
