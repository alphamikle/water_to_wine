import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalo_assets/lib.dart';

class Jug extends StatelessWidget {
  const Jug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.bottleS);
  }
}
