import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_frontend.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug_with_water.dart';
import 'package:yalo_locale/lib.dart';

class WaterJugView extends StatefulWidget {
  const WaterJugView({Key? key}) : super(key: key);

  @override
  State<WaterJugView> createState() => _WaterJugViewState();
}

class _WaterJugViewState extends State<WaterJugView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  @override
  Widget build(BuildContext context) {
    final LocalizationMessages loc = Messages.of(context);
    final JugChallengeFrontend readonlyJugChallengeFrontend = context.read();

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        actions: [
          IconButton(
            onPressed: readonlyJugChallengeFrontend.doSomeStuff,
            icon: const Icon(
              Icons.extension,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              children: [
                Row(
                  children: [
                    JugWithWater(
                      key: const ValueKey('FIRST JUG'),
                      currentVolume: context.select((JugChallengeFrontend frontend) => frontend.firstJug.currentVolume),
                      maxVolume: context.select((JugChallengeFrontend frontend) => frontend.firstJug.maxVolume),
                    ),
                    const SizedBox(width: 8),
                    JugWithWater(
                      key: const ValueKey('SECOND JUG'),
                      currentVolume: context.select((JugChallengeFrontend frontend) => frontend.secondJug.currentVolume),
                      maxVolume: context.select((JugChallengeFrontend frontend) => frontend.secondJug.maxVolume),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    JugWithWater(
                      key: const ValueKey('TARGET JUG'),
                      currentVolume: context.select((JugChallengeFrontend frontend) => frontend.targetJug.currentVolume),
                      maxVolume: context.select((JugChallengeFrontend frontend) => frontend.targetJug.maxVolume),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
