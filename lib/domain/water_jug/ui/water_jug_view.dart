import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_frontend.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug_with_water.dart';
import 'package:water_jug/service/tools/keys.dart';
import 'package:water_jug/service/ui/simple_animated_icon.dart';
import 'package:yalo_locale/lib.dart';

class WaterJugView extends StatefulWidget {
  const WaterJugView({Key? key}) : super(key: key);

  @override
  State<WaterJugView> createState() => _WaterJugViewState();
}

class _WaterJugViewState extends State<WaterJugView> {
  @override
  Widget build(BuildContext context) {
    final LocalizationMessages loc = Messages.of(context);
    final JugChallengeFrontend readonlyJugChallengeFrontend = context.read();
    final bool isPlaying = context.select((JugChallengeFrontend frontend) => frontend.isPlaying);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        actions: [
          SimpleAnimatedIcon(
            icon: AnimatedIcons.play_pause,
            onPressed: isPlaying ? readonlyJugChallengeFrontend.stop : readonlyJugChallengeFrontend.play,
            state: isPlaying ? AnimatedIconState.showSecond : AnimatedIconState.showFirst,
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            JugWithWater(
              key: Keys.firstJug.asKey,
              currentVolume: context.select((JugChallengeFrontend frontend) => frontend.firstJug.currentVolume),
              maxVolume: context.select((JugChallengeFrontend frontend) => frontend.firstJug.maxVolume),
              onPressed: () => readonlyJugChallengeFrontend.setMaxVolumeOf(Keys.firstJug),
            ),
            JugWithWater(
              key: Keys.secondJug.asKey,
              currentVolume: context.select((JugChallengeFrontend frontend) => frontend.secondJug.currentVolume),
              maxVolume: context.select((JugChallengeFrontend frontend) => frontend.secondJug.maxVolume),
              onPressed: () => readonlyJugChallengeFrontend.setMaxVolumeOf(Keys.secondJug),
            ),
          ],
        ),
      ),
    );
  }
}
