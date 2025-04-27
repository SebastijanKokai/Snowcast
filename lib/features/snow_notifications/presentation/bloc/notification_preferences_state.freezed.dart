// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_preferences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationPreferencesState {
  Map<Mountain, bool> get selectedMountains =>
      throw _privateConstructorUsedError;

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationPreferencesStateCopyWith<NotificationPreferencesState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPreferencesStateCopyWith<$Res> {
  factory $NotificationPreferencesStateCopyWith(
          NotificationPreferencesState value,
          $Res Function(NotificationPreferencesState) then) =
      _$NotificationPreferencesStateCopyWithImpl<$Res,
          NotificationPreferencesState>;
  @useResult
  $Res call({Map<Mountain, bool> selectedMountains});
}

/// @nodoc
class _$NotificationPreferencesStateCopyWithImpl<$Res,
        $Val extends NotificationPreferencesState>
    implements $NotificationPreferencesStateCopyWith<$Res> {
  _$NotificationPreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMountains = null,
  }) {
    return _then(_value.copyWith(
      selectedMountains: null == selectedMountains
          ? _value.selectedMountains
          : selectedMountains // ignore: cast_nullable_to_non_nullable
              as Map<Mountain, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationPreferencesStateImplCopyWith<$Res>
    implements $NotificationPreferencesStateCopyWith<$Res> {
  factory _$$NotificationPreferencesStateImplCopyWith(
          _$NotificationPreferencesStateImpl value,
          $Res Function(_$NotificationPreferencesStateImpl) then) =
      __$$NotificationPreferencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<Mountain, bool> selectedMountains});
}

/// @nodoc
class __$$NotificationPreferencesStateImplCopyWithImpl<$Res>
    extends _$NotificationPreferencesStateCopyWithImpl<$Res,
        _$NotificationPreferencesStateImpl>
    implements _$$NotificationPreferencesStateImplCopyWith<$Res> {
  __$$NotificationPreferencesStateImplCopyWithImpl(
      _$NotificationPreferencesStateImpl _value,
      $Res Function(_$NotificationPreferencesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMountains = null,
  }) {
    return _then(_$NotificationPreferencesStateImpl(
      selectedMountains: null == selectedMountains
          ? _value._selectedMountains
          : selectedMountains // ignore: cast_nullable_to_non_nullable
              as Map<Mountain, bool>,
    ));
  }
}

/// @nodoc

class _$NotificationPreferencesStateImpl
    implements _NotificationPreferencesState {
  _$NotificationPreferencesStateImpl(
      {final Map<Mountain, bool> selectedMountains = const {}})
      : _selectedMountains = selectedMountains;

  final Map<Mountain, bool> _selectedMountains;
  @override
  @JsonKey()
  Map<Mountain, bool> get selectedMountains {
    if (_selectedMountains is EqualUnmodifiableMapView)
      return _selectedMountains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedMountains);
  }

  @override
  String toString() {
    return 'NotificationPreferencesState(selectedMountains: $selectedMountains)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPreferencesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedMountains, _selectedMountains));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedMountains));

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPreferencesStateImplCopyWith<
          _$NotificationPreferencesStateImpl>
      get copyWith => __$$NotificationPreferencesStateImplCopyWithImpl<
          _$NotificationPreferencesStateImpl>(this, _$identity);
}

abstract class _NotificationPreferencesState
    implements NotificationPreferencesState {
  factory _NotificationPreferencesState(
          {final Map<Mountain, bool> selectedMountains}) =
      _$NotificationPreferencesStateImpl;

  @override
  Map<Mountain, bool> get selectedMountains;

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationPreferencesStateImplCopyWith<
          _$NotificationPreferencesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
