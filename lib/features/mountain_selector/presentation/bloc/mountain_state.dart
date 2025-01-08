import 'package:freezed_annotation/freezed_annotation.dart';

part 'mountain_state.freezed.dart';

enum Mountain {
  jahorina("Jahorina"),
  kopaonik("Kopaonik"),
  zlatibor("Zlatibor"),
  bansko("Bansko");

  const Mountain(this.name);
  final String name;
}

@freezed
class MountainState with _$MountainState {
  factory MountainState({
    @Default(Mountain.jahorina) Mountain selectedMountain,
    @Default('') String webcamUrl,
  }) = _MountainState;
}
