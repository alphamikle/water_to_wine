import 'package:flutter/material.dart';
import 'package:water_jug/service/di/mounted_initializable.dart';
import 'package:water_jug/service/notifications/notification_snack_bar.dart';
import 'package:water_jug/service/tools/durations.dart';

class SnackBarDelegate implements MountedInitializable {
  late final GlobalKey<ScaffoldState> _rootScaffoldKey;
  BuildContext get _context => _rootScaffoldKey.currentContext!;
  ScaffoldMessengerState get _scaffoldMessenger => ScaffoldMessenger.of(_context);

  void hideSnackBar() {
    _scaffoldMessenger.removeCurrentSnackBar();
  }

  void showNotification(String text, {Duration? duration}) {
    hideSnackBar();
    _scaffoldMessenger.showSnackBar(
      buildNotificationSnackBar(
        context: _context,
        text: text,
        duration: duration ?? Durations.defaultSnackBarDuration,
      ),
    );
  }

  void showError(String text) {
    hideSnackBar();
    _scaffoldMessenger.showSnackBar(buildErrorSnackBar(context: _context, text: text));
  }

  @override
  Future<void> mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey) async {
    _rootScaffoldKey = rootScaffoldKey;
  }
}
