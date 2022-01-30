import 'package:flutter/material.dart';

abstract class Keys {
  static const String firstJug = 'FIRST JUG';
  static const String secondJug = 'SECOND JUG';
}

extension StringToValueKey on String {
  ValueKey get asKey => ValueKey(this);
}
