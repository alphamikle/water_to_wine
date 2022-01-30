import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_state.dart';
import 'package:water_jug/domain/water_jug/logic/jug_entity.dart';
import 'package:water_jug/domain/water_jug/ui/components/capacity_amont_modal.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug_with_water.dart';
import 'package:water_jug/service/tools/keys.dart';
import 'package:water_jug/service/tools/paddings.dart';
import 'package:water_jug/service/ui/simple_animated_icon.dart';
import 'package:yalo_locale/lib.dart';

class WaterJugView extends StatelessWidget {
  const WaterJugView({Key? key}) : super(key: key);

  Future<void> _setJugCapacity(BuildContext context, JugId jugId) async {
    final JugChallengeState readonlyJugChallengeState = context.read();
    final int? capacity = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CapacityAmountModal(initialValue: readonlyJugChallengeState.jugs[jugId]!.maxVolume),
    );
    readonlyJugChallengeState.setMaxVolumeOf(jugId, capacity);
  }

  Future<void> _setWishedCapacity(BuildContext context) async {
    final JugChallengeState readonlyJugChallengeState = context.read();
    final int? capacity = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CapacityAmountModal(initialValue: readonlyJugChallengeState.wishedCapacity),
    );
    readonlyJugChallengeState.setWishedCapacity(capacity);
  }

  void _play(BuildContext context) {}

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
              onPressed: isPlaying ? readonlyJugChallengeState.stop : () => _play(context),
              state: isPlaying ? AnimatedIconState.showSecond : AnimatedIconState.showFirst,
            ),
          ),
          Tooltip(
            message: loc.jugView.actions.setWantedAmount,
            child: IconButton(
              onPressed: () => _setWishedCapacity(context),
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
            children: [
              JugWithWater(
                key: Keys.firstJug.asKey,
                currentVolume: context.select((JugChallengeState me) => me.firstJug.currentVolume),
                maxVolume: context.select((JugChallengeState me) => me.firstJug.maxVolume),
                onPressed: () => _setJugCapacity(context, Keys.firstJug),
              ),
              JugWithWater(
                key: Keys.secondJug.asKey,
                currentVolume: context.select((JugChallengeState me) => me.secondJug.currentVolume),
                maxVolume: context.select((JugChallengeState me) => me.secondJug.maxVolume),
                onPressed: () => _setJugCapacity(context, Keys.secondJug),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
