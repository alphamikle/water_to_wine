import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/ui/water_jug_view.dart';
import 'package:water_jug/service/di/dependencies_initializer.dart';
import 'package:water_jug/service/mixins/after_first_render.dart';
import 'package:yalo_locale/lib.dart';

Future<void> main() async {
  final initializer = DependenciesInitializer();
  await initializer.init();
  runApp(
    DevicePreview(
      availableLocales: supportedLocales,
      builder: (_) => MyApp(
        initializer: initializer,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    required this.initializer,
    Key? key,
  }) : super(key: key);

  final DependenciesInitializer initializer;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AfterFirstRender<MyApp> {
  final GlobalKey<ScaffoldState> _rootScaffoldKey = GlobalKey();

  @override
  void afterFirstRender() {
    widget.initializer.mountedInit(_rootScaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...widget.initializer.providers],
      builder: (_, __) => MaterialApp(
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        locale: DevicePreview.locale(context),
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        onGenerateTitle: (BuildContext context) => Messages.of(context).appTitle,
        home: Scaffold(
          key: _rootScaffoldKey,
          body: const WaterJugView(),
        ),
      ),
    );
  }
}
