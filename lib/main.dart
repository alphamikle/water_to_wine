import 'package:flutter/material.dart';
import 'package:water_jug/domain/water_jug/ui/water_jug_view.dart';
import 'package:water_jug/service/tools/locale_tools.dart';
import 'package:yalo_locale/lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        );
      },
    );
  }
}
