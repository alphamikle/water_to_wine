import 'package:flutter/material.dart';

SnackBar buildNotificationSnackBar({
  required BuildContext context,
  required String text,
}) {
  return SnackBar(content: Text(text));
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
