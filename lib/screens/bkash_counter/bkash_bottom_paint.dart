import 'package:flutter/material.dart';

class BkashBottomPaint extends CustomPainter {
  final Color color;

  const BkashBottomPaint({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..color = color;
    final path = Path();
    path.moveTo(0, h);
    //path.quadraticBezierTo(w / 2, 0, w, h);
    path.cubicTo(w * .5 / 6, 0, w * 5.5 / 6, 0, w, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
