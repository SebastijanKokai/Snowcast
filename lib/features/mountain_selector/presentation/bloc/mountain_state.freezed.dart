// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mountain_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MountainState {
  Mountain get selectedMountain => throw _privateConstructorUsedError;
  String get webcamUrl => throw _privateConstructorUsedError;

  /// Create a copy of MountainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MountainStateCopyWith<MountainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MountainStateCopyWith<$Res> {
  factory $MountainStateCopyWith(
          MountainState value, $Res Function(MountainState) then) =
      _$MountainStateCopyWithImpl<$Res, MountainState>;
  @useResult
  $Res call({Mountain selectedMountain, String webcamUrl});
}

/// @nodoc
class _$MountainStateCopyWithImpl<$Res, $Val extends MountainState>
    implements $MountainStateCopyWith<$Res> {
  _$MountainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MountainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMountain = null,
    Object? webcamUrl = null,
  }) {
    return _then(_value.copyWith(
      selectedMountain: null == selectedMountain
          ? _value.selectedMountain
          : selectedMountain // ignore: cast_nullable_to_non_nullable
              as Mountain,
      webcamUrl: null == webcamUrl
          ? _value.webcamUrl
          : webcamUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MountainStateImplCopyWith<$Res>
    implements $MountainStateCopyWith<$Res> {
  factory _$$MountainStateImplCopyWith(
          _$MountainStateImpl value, $Res Function(_$MountainStateImpl) then) =
      __$$MountainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Mountain selectedMountain, String webcamUrl});
}

/// @nodoc
class __$$MountainStateImplCopyWithImpl<$Res>
    extends _$MountainStateCopyWithImpl<$Res, _$MountainStateImpl>
    implements _$$MountainStateImplCopyWith<$Res> {
  __$$MountainStateImplCopyWithImpl(
      _$MountainStateImpl _value, $Res Function(_$MountainStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MountainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMountain = null,
    Object? webcamUrl = null,
  }) {
    return _then(_$MountainStateImpl(
      selectedMountain: null == selectedMountain
          ? _value.selectedMountain
          : selectedMountain // ignore: cast_nullable_to_non_nullable
              as Mountain,
      webcamUrl: null == webcamUrl
          ? _value.webcamUrl
          : webcamUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MountainStateImpl implements _MountainState {
  _$MountainStateImpl(
      {this.selectedMountain = Mountain.jahorina, this.webcamUrl = ''});

  @override
  @JsonKey()
  final Mountain selectedMountain;
  @override
  @JsonKey()
  final String webcamUrl;

  @override
  String toString() {
    return 'MountainState(selectedMountain: $selectedMountain, webcamUrl: $webcamUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MountainStateImpl &&
            (identical(other.selectedMountain, selectedMountain) ||
                other.selectedMountain == selectedMountain) &&
            (identical(other.webcamUrl, webcamUrl) ||
                other.webcamUrl == webcamUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMountain, webcamUrl);

  /// Create a copy of MountainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MountainStateImplCopyWith<_$MountainStateImpl> get copyWith =>
      __$$MountainStateImplCopyWithImpl<_$MountainStateImpl>(this, _$identity);
}

abstract class _MountainState implements MountainState {
  factory _MountainState(
      {final Mountain selectedMountain,
      final String webcamUrl}) = _$MountainStateImpl;

  @override
  Mountain get selectedMountain;
  @override
  String get webcamUrl;

  /// Create a copy of MountainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MountainStateImplCopyWith<_$MountainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
