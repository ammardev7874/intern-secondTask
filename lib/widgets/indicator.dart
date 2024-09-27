import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyCircularProgressIndicator extends StatefulWidget {
  const MyCircularProgressIndicator({super.key});

  @override
  _MyCircularProgressIndicatorState createState() =>
      _MyCircularProgressIndicatorState();
}

class _MyCircularProgressIndicatorState
    extends State<MyCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 55, // Adjust the size as needed
        height:55, // Adjust the size as needed
        child: CustomPaint(
          painter: _MyCircularProgressIndicatorPainter(_animation.value),
        ),
      ),
    );
  }
}

class _MyCircularProgressIndicatorPainter extends CustomPainter {
  final double _animationValue;

  _MyCircularProgressIndicatorPainter(this._animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2.5;

    final List<Color> colors = [
      const Color(0xff465B43), // Darkest shade
      const Color(0xffA1B68C),
      const Color(0xff465B43),
      const Color(0xffA1B68C), // Lightest shade
    ];

    final double dotSize = size.width / 12;

    for (int i = 0; i < 6; i++) {
      final double angle = (i / 6) * 2 * 3.14159265359 +
          _animationValue * 2 * 3.14159265359;
      final double x = centerX + radius * math.sin(angle);
      final double y = centerY - radius * math.cos(angle);

      final int colorIndex = ((i + (_animationValue * 6).floor()) % 4)
          .toInt(); // Calculate color index based on animation

      canvas.drawCircle(
        Offset(x, y),
        dotSize,
        Paint()
          ..color = colors[colorIndex]
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(_MyCircularProgressIndicatorPainter oldDelegate) {
    return oldDelegate._animationValue != _animationValue;
  }
}
