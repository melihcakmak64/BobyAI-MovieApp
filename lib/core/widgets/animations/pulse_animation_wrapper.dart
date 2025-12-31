import 'package:flutter/material.dart';

class PulseAnimation extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final double pulseScale; // Ne kadar genişlesin? (Örn: 1.08)
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
  late AnimationController _controller;
  late Animation<double> _scaleX;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _scaleX = Tween<double>(
      begin: 1.0,
      end: widget.pulseScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isActive) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(PulseAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _controller.repeat(reverse: true);
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.reverse(); // Durdururken başlangıç boyutuna döner
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
      animation: _scaleX,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          // Sadece X (genişlik) değişir, Y (yükseklik) 1.0'da sabit kalır
          transform: Matrix4.diagonal3Values(_scaleX.value, 1.0, 1.0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
