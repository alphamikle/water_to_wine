import 'package:flutter/cupertino.dart';
import 'package:water_jug/domain/water_jug/logic/jug_entity.dart';
import 'package:water_jug/service/tools/keys.dart';

class JugChallengeFrontend with ChangeNotifier {
  bool isFilled = false;
  bool isPlaying = false;

  JugEntity get firstJug => jugs[Keys.firstJug]!;
  JugEntity get secondJug => jugs[Keys.secondJug]!;

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

  Future<void> setMaxVolumeOf(String jugId, int? maxVolume) async {
    assert(jugs.keys.contains(jugId));
    if (maxVolume != null) {
      jugs[jugId] = jugs[jugId]!.copyWith(maxVolume: maxVolume);
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
