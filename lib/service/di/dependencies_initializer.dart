import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_state.dart';
import 'package:water_jug/service/di/mounted_initializable.dart';
import 'package:water_jug/service/locale/locale_delegate.dart';
import 'package:water_jug/service/notifications/snack_bar_delegate.dart';
import 'package:water_jug/service/routing/modal_delegate.dart';

class DependenciesInitializer {
  final List<dynamic> dependencies = [];
  final List<SingleChildWidget> providers = [];

  Future<void> init() async {
    final ModalDelegate modalDelegate = ModalDelegate();
    final SnackBarDelegate snackBarDelegate = SnackBarDelegate();
    final LocaleDelegate localeDelegate = LocaleDelegate();
    final JugChallengeState jugChallengeState = JugChallengeState(
      modalDelegate: modalDelegate,
      snackBarDelegate: snackBarDelegate,
      localeDelegate: localeDelegate,
    );

    dependencies.clear();
    dependencies.addAll([
      modalDelegate,
      snackBarDelegate,
      localeDelegate,
      jugChallengeState,
    ]);

    providers.clear();
    providers.addAll([
      Provider.value(value: modalDelegate),
      Provider.value(value: snackBarDelegate),
      Provider.value(value: localeDelegate),
      ChangeNotifierProvider.value(value: jugChallengeState),
    ]);
  }

  void mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey) {
    dependencies.whereType<MountedInitializable>().forEach(
          (MountedInitializable me) => me.mountedInit(
            rootScaffoldKey,
          ),
        );
  }
}
