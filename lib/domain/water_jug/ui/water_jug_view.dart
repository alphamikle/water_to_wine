import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/entities/jug_entity.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_state.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug_with_water.dart';
import 'package:water_jug/service/tools/keys.dart';
import 'package:water_jug/service/tools/paddings.dart';
import 'package:water_jug/service/ui/simple_animated_icon.dart';
import 'package:yalo_locale/lib.dart';

class WaterJugView extends StatelessWidget {
  const WaterJugView({Key? key}) : super(key: key);

  Widget _jugBuilder(BuildContext context, JugId jugId) {
    final JugChallengeState readonlyJugChallengeState = context.read();
    final int currentVolume = context.select((JugChallengeState me) => me.getJugById(jugId).currentVolume);
    final int maxVolume = context.select((JugChallengeState me) => me.getJugById(jugId).maxVolume);
    final int wishedCapacity = context.select((JugChallengeState frontend) => frontend.wishedCapacity);

    return JugWithWater(
      key: jugId.asKey,
      currentVolume: currentVolume,
      maxVolume: maxVolume,
      onPressed: () => readonlyJugChallengeState.setJugCapacity(jugId),
      isWine: currentVolume > 0 && maxVolume > 0 && wishedCapacity == currentVolume,
    );
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationMessages loc = Messages.of(context);
    final JugChallengeState readonlyJugChallengeState = context.read();
    final bool isPlaying = context.select((JugChallengeState me) => me.isPlaying);

    return Scaffold(
      appBar: AppBar(
        title: AnimatedText(
          context.select((JugChallengeState me) => me.isWishedCapacityFilled) ? '${loc.jugView.wishedAmount}${context.select((JugChallengeState me) => me.wishedCapacity)}' : loc.appTitle,
        ),
        actions: [
          Tooltip(
            message: isPlaying ? loc.jugView.actions.stop : loc.jugView.actions.start,
            child: SimpleAnimatedIcon(
              icon: AnimatedIcons.play_pause,
              onPressed: isPlaying ? readonlyJugChallengeState.stop : readonlyJugChallengeState.play,
              state: isPlaying ? AnimatedIconState.showSecond : AnimatedIconState.showFirst,
            ),
          ),
          Tooltip(
            message: loc.jugView.actions.setWantedAmount,
            child: IconButton(
              onPressed: readonlyJugChallengeState.setWishedCapacity,
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: Paddings.x1, bottom: Paddings.x1),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Keys.firstJug, Keys.secondJug].map((JugId jugId) => _jugBuilder(context, jugId)).toList(),
          ),
        ),
      ),
    );
  }
}
