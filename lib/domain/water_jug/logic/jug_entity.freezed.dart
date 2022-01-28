// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jug_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$JugEntityTearOff {
  const _$JugEntityTearOff();

  _JugEntity call({required int currentVolume, required int maxVolume}) {
    return _JugEntity(
      currentVolume: currentVolume,
      maxVolume: maxVolume,
    );
  }
}

/// @nodoc
const $JugEntity = _$JugEntityTearOff();

/// @nodoc
mixin _$JugEntity {
  int get currentVolume => throw _privateConstructorUsedError;
  int get maxVolume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JugEntityCopyWith<JugEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JugEntityCopyWith<$Res> {
  factory $JugEntityCopyWith(JugEntity value, $Res Function(JugEntity) then) =
      _$JugEntityCopyWithImpl<$Res>;
  $Res call({int currentVolume, int maxVolume});
}

/// @nodoc
class _$JugEntityCopyWithImpl<$Res> implements $JugEntityCopyWith<$Res> {
  _$JugEntityCopyWithImpl(this._value, this._then);

  final JugEntity _value;
  // ignore: unused_field
  final $Res Function(JugEntity) _then;

  @override
  $Res call({
    Object? currentVolume = freezed,
    Object? maxVolume = freezed,
  }) {
    return _then(_value.copyWith(
      currentVolume: currentVolume == freezed
          ? _value.currentVolume
          : currentVolume // ignore: cast_nullable_to_non_nullable
              as int,
      maxVolume: maxVolume == freezed
          ? _value.maxVolume
          : maxVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$JugEntityCopyWith<$Res> implements $JugEntityCopyWith<$Res> {
  factory _$JugEntityCopyWith(
          _JugEntity value, $Res Function(_JugEntity) then) =
      __$JugEntityCopyWithImpl<$Res>;
  @override
  $Res call({int currentVolume, int maxVolume});
}

/// @nodoc
class __$JugEntityCopyWithImpl<$Res> extends _$JugEntityCopyWithImpl<$Res>
    implements _$JugEntityCopyWith<$Res> {
  __$JugEntityCopyWithImpl(_JugEntity _value, $Res Function(_JugEntity) _then)
      : super(_value, (v) => _then(v as _JugEntity));

  @override
  _JugEntity get _value => super._value as _JugEntity;

  @override
  $Res call({
    Object? currentVolume = freezed,
    Object? maxVolume = freezed,
  }) {
    return _then(_JugEntity(
      currentVolume: currentVolume == freezed
          ? _value.currentVolume
          : currentVolume // ignore: cast_nullable_to_non_nullable
              as int,
      maxVolume: maxVolume == freezed
          ? _value.maxVolume
          : maxVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_JugEntity implements _JugEntity {
  const _$_JugEntity({required this.currentVolume, required this.maxVolume});

  @override
  final int currentVolume;
  @override
  final int maxVolume;

  @override
  String toString() {
    return 'JugEntity(currentVolume: $currentVolume, maxVolume: $maxVolume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JugEntity &&
            const DeepCollectionEquality()
                .equals(other.currentVolume, currentVolume) &&
            const DeepCollectionEquality().equals(other.maxVolume, maxVolume));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentVolume),
      const DeepCollectionEquality().hash(maxVolume));

  @JsonKey(ignore: true)
  @override
  _$JugEntityCopyWith<_JugEntity> get copyWith =>
      __$JugEntityCopyWithImpl<_JugEntity>(this, _$identity);
}

abstract class _JugEntity implements JugEntity {
  const factory _JugEntity(
      {required int currentVolume, required int maxVolume}) = _$_JugEntity;

  @override
  int get currentVolume;
  @override
  int get maxVolume;
  @override
  @JsonKey(ignore: true)
  _$JugEntityCopyWith<_JugEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
