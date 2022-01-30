import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_frontend.dart';
import 'package:water_jug/domain/water_jug/logic/jug_entity.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug_fill_max_volume_modal.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug_with_water.dart';
import 'package:water_jug/service/tools/keys.dart';
import 'package:water_jug/service/tools/paddings.dart';
import 'package:water_jug/service/ui/simple_animated_icon.dart';
import 'package:yalo_locale/lib.dart';

class WaterJugView extends StatelessWidget {
  const WaterJugView({Key? key}) : super(key: key);

  Future<void> _setJugCapacity(BuildContext context, JugId jugId) async {
    final JugChallengeFrontend readonlyJugChallengeFrontend = context.read();
    final int? capacity = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => JugFillMaxVolumeModal(
        jugId: jugId,
      ),
    );
    readonlyJugChallengeFrontend.setMaxVolumeOf(jugId, capacity);
  }

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
      body: Padding(
        padding: const EdgeInsets.only(top: Paddings.x1, bottom: Paddings.x1),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              JugWithWater(
                key: Keys.firstJug.asKey,
                currentVolume: context.select((JugChallengeFrontend frontend) => frontend.firstJug.currentVolume),
                maxVolume: context.select((JugChallengeFrontend frontend) => frontend.firstJug.maxVolume),
                onPressed: () => _setJugCapacity(context, Keys.firstJug),
              ),
              JugWithWater(
                key: Keys.secondJug.asKey,
                currentVolume: context.select((JugChallengeFrontend frontend) => frontend.secondJug.currentVolume),
                maxVolume: context.select((JugChallengeFrontend frontend) => frontend.secondJug.maxVolume),
                onPressed: () => _setJugCapacity(context, Keys.secondJug),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
