import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_frontend.dart';
import 'package:water_jug/domain/water_jug/ui/water_jug_view.dart';
import 'package:water_jug/service/tools/locale_tools.dart';
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
      child: FutureBuilder(
        future: LocalizationDelegate().load(LocaleTools.currentLocale()).then((LocalizationMessages loc) => loc.appTitle),
        initialData: '...',
        builder: (BuildContext context, AsyncSnapshot<String> appTitle) {
          /// I don't use [MaterialApp.router] because there will not be any routing logic - only one view
          return MaterialApp(
            title: appTitle.data!,
            supportedLocales: supportedLocales,
            localizationsDelegates: localizationsDelegates,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const WaterJugView(),
            locale: DevicePreview.locale(context),
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
          );
        },
      ),
    );
  }
}
