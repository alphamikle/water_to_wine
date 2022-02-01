import 'package:flutter/material.dart';
import 'package:water_jug/service/tools/durations.dart';

SnackBar buildNotificationSnackBar({
  required BuildContext context,
  required String text,
  Duration duration = Durations.defaultSnackBarDuration,
}) {
  return SnackBar(
    content: Text(text),
    duration: duration,
  );
}

SnackBar buildErrorSnackBar({
  required BuildContext context,
  required String text,
}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: Theme.of(context).errorColor,
  );
}
