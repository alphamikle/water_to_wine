import 'package:flutter/cupertino.dart';
import 'package:water_jug/domain/water_jug/logic/jug_entity.dart';

class JugChallengeFrontend with ChangeNotifier {
  bool isFilled = false;

  JugEntity firstJug = const JugEntity(currentVolume: 0, maxVolume: 0);
  JugEntity secondJug = const JugEntity(currentVolume: 0, maxVolume: 0);
  JugEntity targetJug = const JugEntity(currentVolume: 0, maxVolume: 0);

  Duration duration = const Duration(seconds: 2);
  Duration get _delay => duration * 1.1;

  void fillMaxVolumes() {
    firstJug = firstJug.copyWith(maxVolume: 2);
    secondJug = secondJug.copyWith(maxVolume: 10);
    targetJug = targetJug.copyWith(maxVolume: 4);
    isFilled = true;
    notifyListeners();
  }

  Future<void> doSomeStuff() async {
    if (isFilled) {
      duration = duration * 0.8;
      firstJug = const JugEntity(currentVolume: 0, maxVolume: 0);
      secondJug = const JugEntity(currentVolume: 0, maxVolume: 0);
      targetJug = const JugEntity(currentVolume: 0, maxVolume: 0);
      isFilled = false;
      notifyListeners();
      await Future<void>.delayed(_delay);
    }

    fillMaxVolumes();
    await Future<void>.delayed(_delay);

    firstJug = firstJug.copyWith(currentVolume: 2);
    notifyListeners();
    await Future<void>.delayed(_delay);

    firstJug = firstJug.copyWith(currentVolume: 0);
    secondJug = secondJug.copyWith(currentVolume: 2);
    notifyListeners();
    await Future<void>.delayed(_delay);

    firstJug = firstJug.copyWith(currentVolume: 2);
    notifyListeners();
    await Future<void>.delayed(_delay);

    firstJug = firstJug.copyWith(currentVolume: 0);
    secondJug = secondJug.copyWith(currentVolume: 0);
    targetJug = targetJug.copyWith(currentVolume: 4);
    notifyListeners();
    await Future<void>.delayed(_delay);
  }
}
