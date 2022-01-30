import 'package:flutter/material.dart';

abstract class MountedInitializable {
  Future<void> mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey);
}
