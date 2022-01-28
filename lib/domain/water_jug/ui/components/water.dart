import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalo_assets/lib.dart';

class Water extends StatelessWidget {
  const Water({
    required this.quantity,
    Key? key,
  })  : assert(quantity >= 0 && quantity <= 1),
        super(key: key);

  final double quantity;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SvgPicture.asset(Assets.waterS),
      clipper: _WaterClipper(quantity),
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
