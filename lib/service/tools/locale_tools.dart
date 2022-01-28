import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class LocaleTools {
  static Locale currentLocale() {
    /// By default it will be something like that - en_US
    final locale = Intl.getCurrentLocale();
    final localeParts = locale.split('_');

    /// We interesting in only language part of locale, not in country part
    return Locale(localeParts.first);
  }
}
