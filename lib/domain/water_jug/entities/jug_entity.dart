import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jug_entity.freezed.dart';

typedef JugId = String;

@immutable
@freezed
class JugEntity with _$JugEntity {
  const factory JugEntity({
    required JugId id,
    required int currentVolume,
    required int maxVolume,
  }) = _JugEntity;
}
