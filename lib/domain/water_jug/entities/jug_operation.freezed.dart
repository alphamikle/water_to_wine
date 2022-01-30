// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jug_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$JugOperationTearOff {
  const _$JugOperationTearOff();

  _JugOperation call({required String jugId, required JugOperationType type}) {
    return _JugOperation(
      jugId: jugId,
      type: type,
    );
  }
}

/// @nodoc
const $JugOperation = _$JugOperationTearOff();

/// @nodoc
mixin _$JugOperation {
  String get jugId => throw _privateConstructorUsedError;
  JugOperationType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JugOperationCopyWith<JugOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JugOperationCopyWith<$Res> {
  factory $JugOperationCopyWith(
          JugOperation value, $Res Function(JugOperation) then) =
      _$JugOperationCopyWithImpl<$Res>;
  $Res call({String jugId, JugOperationType type});
}

/// @nodoc
class _$JugOperationCopyWithImpl<$Res> implements $JugOperationCopyWith<$Res> {
  _$JugOperationCopyWithImpl(this._value, this._then);

  final JugOperation _value;
  // ignore: unused_field
  final $Res Function(JugOperation) _then;

  @override
  $Res call({
    Object? jugId = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      jugId: jugId == freezed
          ? _value.jugId
          : jugId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JugOperationType,
    ));
  }
}

/// @nodoc
abstract class _$JugOperationCopyWith<$Res>
    implements $JugOperationCopyWith<$Res> {
  factory _$JugOperationCopyWith(
          _JugOperation value, $Res Function(_JugOperation) then) =
      __$JugOperationCopyWithImpl<$Res>;
  @override
  $Res call({String jugId, JugOperationType type});
}

/// @nodoc
class __$JugOperationCopyWithImpl<$Res> extends _$JugOperationCopyWithImpl<$Res>
    implements _$JugOperationCopyWith<$Res> {
  __$JugOperationCopyWithImpl(
      _JugOperation _value, $Res Function(_JugOperation) _then)
      : super(_value, (v) => _then(v as _JugOperation));

  @override
  _JugOperation get _value => super._value as _JugOperation;

  @override
  $Res call({
    Object? jugId = freezed,
    Object? type = freezed,
  }) {
    return _then(_JugOperation(
      jugId: jugId == freezed
          ? _value.jugId
          : jugId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JugOperationType,
    ));
  }
}

/// @nodoc

class _$_JugOperation implements _JugOperation {
  const _$_JugOperation({required this.jugId, required this.type});

  @override
  final String jugId;
  @override
  final JugOperationType type;

  @override
  String toString() {
    return 'JugOperation(jugId: $jugId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JugOperation &&
            const DeepCollectionEquality().equals(other.jugId, jugId) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(jugId),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$JugOperationCopyWith<_JugOperation> get copyWith =>
      __$JugOperationCopyWithImpl<_JugOperation>(this, _$identity);
}

abstract class _JugOperation implements JugOperation {
  const factory _JugOperation(
      {required String jugId,
      required JugOperationType type}) = _$_JugOperation;

  @override
  String get jugId;
  @override
  JugOperationType get type;
  @override
  @JsonKey(ignore: true)
  _$JugOperationCopyWith<_JugOperation> get copyWith =>
      throw _privateConstructorUsedError;
}
