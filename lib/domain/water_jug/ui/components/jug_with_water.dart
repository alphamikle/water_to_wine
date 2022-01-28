import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug.dart';
import 'package:water_jug/domain/water_jug/ui/components/water.dart';

class JugWithWater extends StatelessWidget {
  const JugWithWater({
    required this.currentVolume,
    required this.maxVolume,
    Key? key,
  })  : assert(maxVolume > 0 && currentVolume <= maxVolume && currentVolume >= 0),
        super(key: key);

  final int maxVolume;
  final int currentVolume;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 6,
          child: Water(quantity: currentVolume / maxVolume),
        ),
        const Jug(),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: AnimatedText('$currentVolume / $maxVolume'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
