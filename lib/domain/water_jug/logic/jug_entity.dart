import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jug_entity.freezed.dart';

@immutable
@freezed
class JugEntity with _$JugEntity {
  const factory JugEntity({
    required int currentVolume,
    required int maxVolume,
  }) = _JugEntity;
}
