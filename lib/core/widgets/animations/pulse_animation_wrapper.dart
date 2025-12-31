import 'package:flutter/material.dart';

class PulseAnimation extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final double pulseScale;
  final Duration duration;

  const PulseAnimation({
    super.key,
    required this.child,
    required this.isActive,
    this.pulseScale = 1.08,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _scale = Tween<double>(
      begin: 1.0,
      end: widget.pulseScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant PulseAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isActive != widget.isActive) {
      if (widget.isActive) {
        _controller.repeat(reverse: true);
      } else {
        _controller.animateTo(0.0, curve: Curves.easeOut);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      child: widget.child,
      builder: (_, child) {
        return Transform.scale(
          scaleX: _scale.value,
          scaleY: 1.0,
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }
}
