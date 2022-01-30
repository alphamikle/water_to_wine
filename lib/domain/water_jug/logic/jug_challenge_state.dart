import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:water_jug/domain/water_jug/entities/jug_entity.dart';
import 'package:water_jug/domain/water_jug/entities/jug_operation.dart';
import 'package:water_jug/service/routing/modal_delegate.dart';
import 'package:water_jug/service/tools/durations.dart';
import 'package:water_jug/service/tools/keys.dart';

class JugChallengeState with ChangeNotifier {
  JugChallengeState({
    required ModalDelegate modalDelegate,
  }) : _modalDelegate = modalDelegate;

  final ModalDelegate _modalDelegate;

  final Map<JugId, JugEntity> _jugs = {
    Keys.firstJug: const JugEntity(
      id: Keys.firstJug,
      currentVolume: 0,
      maxVolume: 0,
    ),
    Keys.secondJug: const JugEntity(
      id: Keys.secondJug,
      currentVolume: 0,
      maxVolume: 0,
    ),
  };
  final Queue<JugOperation> _operations = Queue();

  bool isFilled = false;
  bool isPlaying = false;
  int wishedCapacity = 0;

  JugEntity get firstJug => _jugs[Keys.firstJug]!;
  JugEntity get secondJug => _jugs[Keys.secondJug]!;
  bool get isWishedCapacityFilled => wishedCapacity > 0;

  Future<void> setJugCapacity({
    required JugId jugId,
    required String hint,
  }) async {
    assert(_jugs.keys.contains(jugId));
    final int? maxCapacity = await _modalDelegate.inputWaterCapacity(
      currentCapacity: _jugs[jugId]!.maxVolume,
      hint: hint,
    );
    if (maxCapacity != null && maxCapacity > 0) {
      _jugs[jugId] = _jugs[jugId]!.copyWith(maxVolume: maxCapacity);
      notifyListeners();
    }
  }

  Future<void> setWishedCapacity(String hint) async {
    final int? wishedCapacity = await _modalDelegate.inputWaterCapacity(
      currentCapacity: this.wishedCapacity,
      hint: hint,
    );
    if (wishedCapacity != null && wishedCapacity > 0) {
      this.wishedCapacity = wishedCapacity;
      notifyListeners();
    }
  }

  Future<void> play() async {
    isPlaying = true;
    notifyListeners();
    await _computeOperations();
    await _playOperations();
  }

  void stop() {
    isPlaying = false;
    notifyListeners();
  }

  Future<void> _computeOperations() async {
    _operations.addAll([
      const JugOperation(jugId: Keys.firstJug, type: JugOperationType.fill),
      const JugOperation(jugId: Keys.firstJug, type: JugOperationType.transfer),
      const JugOperation(jugId: Keys.firstJug, type: JugOperationType.fill),
      const JugOperation(jugId: Keys.firstJug, type: JugOperationType.transfer),
    ]);
  }

  Future<void> _playOperations() async {
    while (_operations.isNotEmpty) {
      await _playOperation(_operations.removeFirst());
    }
  }

  Future<void> _playOperation(JugOperation operation) async {
    switch (operation.type) {
      case JugOperationType.fill:
        {
          _jugs[operation.jugId] = _jugs[operation.jugId]!.copyWith(
            currentVolume: _jugs[operation.jugId]!.maxVolume,
          );
          break;
        }
      case JugOperationType.empty:
        {
          _jugs[operation.jugId] = _jugs[operation.jugId]!.copyWith(
            currentVolume: 0,
          );
          break;
        }
      case JugOperationType.transfer:
        {
          final JugId oppositeJugId = operation.jugId == Keys.firstJug ? Keys.secondJug : Keys.firstJug;
          final int currentAmount = _jugs[operation.jugId]!.currentVolume;
          _jugs[oppositeJugId] = _jugs[oppositeJugId]!.copyWith(
            currentVolume: _jugs[oppositeJugId]!.currentVolume + currentAmount,
          );
          _jugs[operation.jugId] = _jugs[operation.jugId]!.copyWith(
            currentVolume: 0,
          );
          break;
        }
      default:
        {
          assert(false, 'Unregistered $JugOperationType: ${operation.type}');
        }
    }
    notifyListeners();
    await Future<void>.delayed(Durations.jugFillingDuration * 1.05);
  }
}
