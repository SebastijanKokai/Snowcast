import 'package:equatable/equatable.dart';

enum Mountain { unknown, zlatibor, jahorina, kopaonik }

class MountainSelectorState extends Equatable {
  MountainSelectorState(
      {Mountain? selectedMountain, List<Mountain>? availableMountains}) {
    this.availableMountains = availableMountains ?? _getInitialMountains();
    this.selectedMountain = selectedMountain ?? _getInitialMountain();
  }

  late final Mountain selectedMountain;
  late final List<Mountain> availableMountains;

  @override
  List<Object?> get props => [selectedMountain, availableMountains];

  MountainSelectorState copyWith(
      {Mountain? selectedMountain, List<Mountain>? availableMountains}) {
    return MountainSelectorState(
      selectedMountain: selectedMountain ?? this.selectedMountain,
      availableMountains: availableMountains ?? this.availableMountains,
    );
  }

  List<Mountain> _getInitialMountains() {
    return [Mountain.zlatibor, Mountain.kopaonik, Mountain.jahorina];
  }

  Mountain _getInitialMountain() {
    return availableMountains.isNotEmpty
        ? availableMountains[0]
        : Mountain.unknown;
  }
}
