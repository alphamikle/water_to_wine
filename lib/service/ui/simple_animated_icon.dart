import 'package:flutter/material.dart';
import 'package:water_jug/service/tools/durations.dart';

enum AnimatedIconState {
  showFirst,
  showSecond,
}

class SimpleAnimatedIcon extends StatefulWidget {
  const SimpleAnimatedIcon({
    required this.icon,
    this.state = AnimatedIconState.showFirst,
    this.duration = Durations.animationDuration,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final AnimatedIconData icon;
  final AnimatedIconState state;
  final Duration duration;
  final VoidCallback? onPressed;

  @override
  _SimpleAnimatedIconState createState() => _SimpleAnimatedIconState();
}

class _SimpleAnimatedIconState extends State<SimpleAnimatedIcon> with SingleTickerProviderStateMixin {
  late AnimatedIconState _prevState;

  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  void _handleStateChanges() {
    if (widget.state != _prevState) {
      if (widget.state == AnimatedIconState.showSecond) {
        _controller.forward(from: 0);
      } else {
        _controller.animateBack(0);
      }
      _prevState = widget.state;
    }
  }

  void _handleDurationChanges() {
    if (widget.duration != _controller.duration) {
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration,
        value: _controller.value,
      );
      _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void didUpdateWidget(covariant SimpleAnimatedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    _handleDurationChanges();
    _handleStateChanges();
  }

  @override
  void initState() {
    super.initState();
    _prevState = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: AnimatedIcon(
        icon: widget.icon,
        progress: _animation,
      ),
    );
  }
}
