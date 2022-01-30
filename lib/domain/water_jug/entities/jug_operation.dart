import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:water_jug/domain/water_jug/entities/jug_entity.dart';

part 'jug_operation.freezed.dart';

enum JugOperationType {
  fill,
  empty,
  transfer,
}

@freezed
class JugOperation with _$JugOperation {
  const factory JugOperation({
    required JugId jugId,
    required JugOperationType type,
  }) = _JugOperation;
}
