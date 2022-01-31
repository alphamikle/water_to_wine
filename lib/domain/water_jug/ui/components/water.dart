import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:water_jug/service/tools/durations.dart';
import 'package:yalo_assets/lib.dart';

class Water extends StatelessWidget {
  const Water({
    required this.quantity,
    this.isWine = false,
    Key? key,
  })  : assert(quantity >= 0 && quantity <= 1),
        super(key: key);

  final double quantity;
  final bool isWine;

  @override
  Widget build(BuildContext context) {
    final water = ClipRect(
      child: SvgPicture.asset(Assets.waterS),
      clipper: _WaterClipper(quantity),
    );
    return AnimatedSwitcher(
      duration: Durations.animationDuration,
      child: isWine
          ? ColorFiltered(
              colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              child: water,
            )
          : water,
    );
  }
}

class _WaterClipper extends CustomClipper<Rect> {
  _WaterClipper(this._height);

  final double _height;

  @override
  Rect getClip(Size size) {
    final width = size.width;
    final height = size.height;
    return Rect.fromLTRB(0, (1 - _height) * height, width, height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}
