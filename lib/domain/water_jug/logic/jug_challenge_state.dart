import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:water_jug/domain/water_jug/entities/jug_entity.dart';
import 'package:water_jug/domain/water_jug/entities/jug_operation.dart';
import 'package:water_jug/service/locale/locale_delegate.dart';
import 'package:water_jug/service/notifications/snack_bar_delegate.dart';
import 'package:water_jug/service/routing/modal_delegate.dart';
import 'package:water_jug/service/tools/durations.dart';
import 'package:water_jug/service/tools/keys.dart';

class JugChallengeState with ChangeNotifier {
  JugChallengeState({
    required ModalDelegate modalDelegate,
    required SnackBarDelegate snackBarDelegate,
    required LocaleDelegate localeDelegate,
  })  : _modalDelegate = modalDelegate,
        _snackBarDelegate = snackBarDelegate,
        _localeDelegate = localeDelegate;

  final ModalDelegate _modalDelegate;
  final SnackBarDelegate _snackBarDelegate;
  final LocaleDelegate _localeDelegate;

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
  int _totalOperation = 0;

  bool isFilled = false;
  bool isPlaying = false;
  int wishedCapacity = 0;

  JugEntity get firstJug => _jugs[Keys.firstJug]!;
  JugEntity get secondJug => _jugs[Keys.secondJug]!;
  bool get isWishedCapacityFilled => wishedCapacity > 0;

  Future<void> setJugCapacity(JugId jugId) async {
    assert(_jugs.keys.contains(jugId));
    final String hint = jugId == Keys.firstJug ? _localeDelegate.loc.jugView.modal.firstJugHint : _localeDelegate.loc.jugView.modal.secondJugHint;
    final int? maxCapacity = await _modalDelegate.inputWaterCapacity(
      currentCapacity: _jugs[jugId]!.maxVolume,
      hint: hint,
    );
    if (maxCapacity != null && maxCapacity > 0) {
      _jugs[jugId] = _jugs[jugId]!.copyWith(maxVolume: maxCapacity);
      notifyListeners();
    }
  }

  Future<void> setWishedCapacity() async {
    final int? wishedCapacity = await _modalDelegate.inputWaterCapacity(
      currentCapacity: this.wishedCapacity,
      hint: _localeDelegate.loc.jugView.modal.wishedAmountHint,
    );
    if (wishedCapacity != null && wishedCapacity > 0) {
      this.wishedCapacity = wishedCapacity;
      notifyListeners();
    }
  }

  Future<void> play() async {
    _validateState();
    await _resetState();
    isPlaying = true;
    notifyListeners();
    await _computeOperations();
    await _playOperations();
    _snackBarDelegate.showNotification('${_localeDelegate.loc.jugView.computationFinished.start}$_totalOperation${_localeDelegate.loc.jugView.computationFinished.end(_totalOperation)}');
    stop();
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
    _totalOperation = _operations.length;
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
          final int oppositeAmount = _jugs[oppositeJugId]!.currentVolume;
          final int oppositeMaxVolume = _jugs[oppositeJugId]!.maxVolume;
          final int maxTransferableAmount = oppositeMaxVolume - oppositeAmount;
          late final int transferableAmount;
          if (currentAmount <= maxTransferableAmount) {
            transferableAmount = currentAmount;
          } else {
            transferableAmount = maxTransferableAmount;
          }
          _jugs[operation.jugId] = _jugs[operation.jugId]!.copyWith(currentVolume: currentAmount - transferableAmount);
          _jugs[oppositeJugId] = _jugs[oppositeJugId]!.copyWith(currentVolume: oppositeAmount + transferableAmount);
          break;
        }
      default:
        {
          assert(false, 'Unregistered $JugOperationType: ${operation.type}');
        }
    }
    notifyListeners();
    await Future<void>.delayed(Durations.jugFillingDelay);
  }

  Future<void> _resetState() async {
    if (_totalOperation == 0 && firstJug.currentVolume == 0 && secondJug.currentVolume == 0) {
      return;
    }
    for (final JugId jugId in _jugs.keys) {
      _jugs[jugId] = _jugs[jugId]!.copyWith(
        currentVolume: 0,
      );
    }
    _totalOperation = 0;
    isPlaying = false;
    notifyListeners();
    await Future<void>.delayed(Durations.jugFillingDelay);
  }

  void _validateState() {
    final List<String> errors = [];
    if (firstJug.maxVolume <= 0) {
      errors.add(_localeDelegate.loc.jugView.errors.firstNotFilled);
    }
    if (secondJug.maxVolume <= 0) {
      errors.add(_localeDelegate.loc.jugView.errors.secondNotFilled);
    }
    if (wishedCapacity <= 0) {
      errors.add(_localeDelegate.loc.jugView.errors.wishedCapacityNotFilled);
    }
    final String complexError = errors.join('\n');
    if (complexError.isNotEmpty) {
      _snackBarDelegate.showError(complexError);
      throw Exception(complexError);
    }
  }
}
