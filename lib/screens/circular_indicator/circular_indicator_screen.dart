import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as math;

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: 240,
              width: 240,
              child: CustomPaint(
                painter: _MyPaint(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final center = Offset(w / 2, h / 2);
    final gradient = SweepGradient(
      tileMode: TileMode.repeated,
      startAngle: math.radians(270),
      endAngle: math.radians(270 + 360),
      colors: [
        Colors.blue[200]!.withOpacity(.1),
        Colors.blue[200]!.withOpacity(.25),
        Colors.blue[200]!.withOpacity(0.6),
        Colors.blue[200]!.withOpacity(0.75),
        Colors.blue[200]!.withOpacity(0.85),
      ],
    );
    final rect = Rect.fromCenter(center: center, width: w, height: h);
    final paint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20
      ..shader = gradient.createShader(rect);
    final paint2 = Paint()..color = Colors.red;
    // back Circular white color
    canvas.drawArc(rect, 0, 360, false, paint);
    // top Circular blue Color
    canvas.drawArc(rect, math.radians(271), math.radians(300), false, paint1);
    //
    double x1 = center.dx - (center.dx) * cos(math.radians(30));
    double y1 = center.dx - (center.dx) * sin(math.radians(30));
    canvas.drawCircle(Offset(x1, y1), 12, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
