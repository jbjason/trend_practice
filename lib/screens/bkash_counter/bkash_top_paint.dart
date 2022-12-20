import 'package:flutter/material.dart';
import 'dart:math' as math;

class BkashTopPaint extends CustomPainter {
  final Color color;
  final double val;
  const BkashTopPaint({required this.color, required this.val});
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    double degToRad(num deg) => deg * (math.pi / 180.0);
    final path = Path();
    path.addArc(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h),
      degToRad(-170),
      degToRad(170 * val),
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
