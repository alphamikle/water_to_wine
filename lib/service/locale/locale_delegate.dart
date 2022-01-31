import 'package:flutter/material.dart';
import 'package:water_jug/service/di/mounted_initializable.dart';
import 'package:yalo_locale/lib.dart';

class LocaleDelegate implements MountedInitializable {
  late final GlobalKey<ScaffoldState> _rootScaffoldKey;
  LocalizationMessages get loc => Messages.of(_rootScaffoldKey.currentContext!);

  @override
  Future<void> mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey) async {
    _rootScaffoldKey = rootScaffoldKey;
  }
}
