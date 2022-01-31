import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';
import 'package:water_jug/domain/water_jug/ui/components/jug.dart';
import 'package:water_jug/domain/water_jug/ui/components/water.dart';
import 'package:water_jug/service/tools/durations.dart';
import 'package:water_jug/service/tools/paddings.dart';
import 'package:yalo_locale/lib.dart';

const _animationCurve = Curves.easeInOut;

class JugWithWater extends StatefulWidget {
  const JugWithWater({
    required this.currentVolume,
    required this.maxVolume,
    required this.isWine,
    this.duration = Durations.jugFillingDuration,
    this.onPressed,
    Key? key,
  })  : assert(maxVolume >= 0 && currentVolume >= 0 && currentVolume <= maxVolume),
        super(key: key);

  final int maxVolume;
  final int currentVolume;
  final Duration duration;
  final VoidCallback? onPressed;
  final bool isWine;

  @override
  State<JugWithWater> createState() => _JugWithWaterState();
}

class _JugWithWaterState extends State<JugWithWater> with SingleTickerProviderStateMixin {
  int _prevVolume = 0;
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: _animationCurve,
  );
  late Tween<double> _quantity = Tween(begin: widget.currentVolume.toDouble(), end: widget.maxVolume.toDouble());

  void _recreateTween() {
    _quantity = Tween(begin: _prevVolume.toDouble(), end: widget.currentVolume.toDouble());
    _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(covariant JugWithWater oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentVolume != _prevVolume) {
      _recreateTween();
      _prevVolume = widget.currentVolume;
    }
    if (_controller.duration != widget.duration) {
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration,
      );
      _animation = CurvedAnimation(
        parent: _controller,
        curve: _animationCurve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationMessages loc = Messages.of(context);

    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 6,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (_, __) => Water(
                quantity: widget.maxVolume == 0 ? 0 : _quantity.animate(_animation).value / widget.maxVolume,
                isWine: widget.isWine,
              ),
            ),
          ),
          const Jug(),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Paddings.x1),
                  child: AnimatedText(
                    widget.isWine
                        ? loc.jugView.thisIsWine
                        : widget.maxVolume == 0
                            ? loc.jugView.emptyJugHint
                            : '${widget.currentVolume} / ${widget.maxVolume}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
