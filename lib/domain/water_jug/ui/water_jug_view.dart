import 'package:flutter/material.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug_with_water.dart';
import 'package:yalo_locale/lib.dart';

class WaterJugView extends StatelessWidget {
  const WaterJugView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalizationMessages loc = Messages.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        actions: [
          IconButton(
            onPressed: () {},
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
                  children: const [
                    JugWithWater(currentVolume: 100, maxVolume: 100),
                    SizedBox(width: 8),
                    JugWithWater(currentVolume: 75, maxVolume: 100),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    JugWithWater(currentVolume: 35, maxVolume: 100),
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
