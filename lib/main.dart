import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_state.dart';
import 'package:water_jug/domain/water_jug/ui/water_jug_view.dart';
import 'package:yalo_locale/lib.dart';

void main() {
  /// Let's imagine, that is some complex initializer, which will doing DI, initialization of services
  /// and getting back the list of app's states
  final states = [
    JugChallengeState(),
  ];
  runApp(
    DevicePreview(
      availableLocales: supportedLocales,
      builder: (_) => MyApp(
        states: states,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.states,
    Key? key,
  }) : super(key: key);

  final List<ChangeNotifier> states;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JugChallengeState>.value(
          value: states.whereType<JugChallengeState>().first,
        ),
      ],
      child: MaterialApp(
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        locale: DevicePreview.locale(context),
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        onGenerateTitle: (BuildContext context) => Messages.of(context).appTitle,
        home: const WaterJugView(),
      ),
    );
  }
}
