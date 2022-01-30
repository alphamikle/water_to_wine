import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_frontend.dart';
import 'package:water_jug/domain/water_jug/ui/water_jug_view.dart';
import 'package:yalo_locale/lib.dart';

void main() {
  /// Let's imagine, that is some complex initializer, which will doing DI, initialization of services
  /// and getting back the list of app's ChangeNotifiers (akka Frontends)
  final frontends = [
    JugChallengeFrontend(),
  ];
  runApp(
    DevicePreview(
      availableLocales: supportedLocales,
      builder: (_) => MyApp(
        frontends: frontends,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.frontends,
    Key? key,
  }) : super(key: key);

  final List<ChangeNotifier> frontends;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JugChallengeFrontend>.value(
          value: frontends.whereType<JugChallengeFrontend>().first,
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
