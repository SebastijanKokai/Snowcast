// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webcam_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebcamState {
  WebcamStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of WebcamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebcamStateCopyWith<WebcamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebcamStateCopyWith<$Res> {
  factory $WebcamStateCopyWith(
          WebcamState value, $Res Function(WebcamState) then) =
      _$WebcamStateCopyWithImpl<$Res, WebcamState>;
  @useResult
  $Res call({WebcamStatus status});
}

/// @nodoc
class _$WebcamStateCopyWithImpl<$Res, $Val extends WebcamState>
    implements $WebcamStateCopyWith<$Res> {
  _$WebcamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebcamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WebcamStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebcamStateImplCopyWith<$Res>
    implements $WebcamStateCopyWith<$Res> {
  factory _$$WebcamStateImplCopyWith(
          _$WebcamStateImpl value, $Res Function(_$WebcamStateImpl) then) =
      __$$WebcamStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WebcamStatus status});
}

/// @nodoc
class __$$WebcamStateImplCopyWithImpl<$Res>
    extends _$WebcamStateCopyWithImpl<$Res, _$WebcamStateImpl>
    implements _$$WebcamStateImplCopyWith<$Res> {
  __$$WebcamStateImplCopyWithImpl(
      _$WebcamStateImpl _value, $Res Function(_$WebcamStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebcamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$WebcamStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WebcamStatus,
    ));
  }
}

/// @nodoc

class _$WebcamStateImpl implements _WebcamState {
  _$WebcamStateImpl({this.status = WebcamStatus.initial});

  @override
  @JsonKey()
  final WebcamStatus status;

  @override
  String toString() {
    return 'WebcamState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebcamStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of WebcamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebcamStateImplCopyWith<_$WebcamStateImpl> get copyWith =>
      __$$WebcamStateImplCopyWithImpl<_$WebcamStateImpl>(this, _$identity);
}

abstract class _WebcamState implements WebcamState {
  factory _WebcamState({final WebcamStatus status}) = _$WebcamStateImpl;

  @override
  WebcamStatus get status;

  /// Create a copy of WebcamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebcamStateImplCopyWith<_$WebcamStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
