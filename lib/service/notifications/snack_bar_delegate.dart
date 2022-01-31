import 'package:flutter/material.dart';
import 'package:water_jug/service/di/mounted_initializable.dart';
import 'package:water_jug/service/notifications/notification_snack_bar.dart';

class SnackBarDelegate implements MountedInitializable {
  late final GlobalKey<ScaffoldState> _rootScaffoldKey;
  BuildContext get _context => _rootScaffoldKey.currentContext!;
  ScaffoldMessengerState get _scaffoldMessenger => ScaffoldMessenger.of(_context);

  void showNotification(String text) {
    _scaffoldMessenger.removeCurrentSnackBar();
    _scaffoldMessenger.showSnackBar(buildNotificationSnackBar(context: _context, text: text));
  }

  void showError(String text) {
    _scaffoldMessenger.removeCurrentSnackBar();
    // TODO(alphamikle): Continue here
    _scaffoldMessenger.showSnackBar(buildErrorSnackBar(context: _context, text: text));
  }

  @override
  Future<void> mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey) async {
    _rootScaffoldKey = rootScaffoldKey;
  }
}
