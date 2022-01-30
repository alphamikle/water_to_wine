import 'package:flutter/material.dart';

mixin AfterFirstRender<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      afterFirstRender();
    });
  }

  void afterFirstRender();
}
