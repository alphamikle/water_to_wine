import 'package:flutter/material.dart';

abstract class MountedInitializable {
  @protected
  Future<void> mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey);
}
