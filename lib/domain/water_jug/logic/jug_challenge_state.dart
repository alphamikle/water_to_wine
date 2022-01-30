import 'package:flutter/cupertino.dart';
import 'package:water_jug/domain/water_jug/logic/jug_entity.dart';
import 'package:water_jug/service/routing/modal_delegate.dart';
import 'package:water_jug/service/tools/keys.dart';

class JugChallengeState with ChangeNotifier {
  JugChallengeState({
    required ModalDelegate modalDelegate,
  }) : _modalDelegate = modalDelegate;

  final ModalDelegate _modalDelegate;

  bool isFilled = false;
  bool isPlaying = false;
  int wishedCapacity = 0;

  JugEntity get firstJug => jugs[Keys.firstJug]!;
  JugEntity get secondJug => jugs[Keys.secondJug]!;
  bool get isWishedCapacityFilled => wishedCapacity > 0;

  final Map<JugId, JugEntity> jugs = {
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

  Future<void> setJugCapacity(JugId jugId) async {
    assert(jugs.keys.contains(jugId));
    final int? maxCapacity = await _modalDelegate.inputWaterCapacity(jugs[jugId]!.maxVolume);
    if (maxCapacity != null && maxCapacity > 0) {
      jugs[jugId] = jugs[jugId]!.copyWith(maxVolume: maxCapacity);
      notifyListeners();
    }
  }

  Future<void> setWishedCapacity() async {
    final int? wishedCapacity = await _modalDelegate.inputWaterCapacity(this.wishedCapacity);
    if (wishedCapacity != null && wishedCapacity > 0) {
      this.wishedCapacity = wishedCapacity;
      notifyListeners();
    }
  }

  Future<void> play() async {
    isPlaying = true;
    notifyListeners();
  }

  void stop() {
    isPlaying = false;
    notifyListeners();
  }
}
