import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlowDelegate1 extends FlowDelegate {
  final Animation<double> controller;
  const FlowDelegate1({required this.controller}) : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    // ! Upper FlowWidgets
    final lastItem = context.childCount - 1;
    final length = context.childCount;
    for (int i = 0; i < length; i++) {
      final theta = i * math.pi * 0.5 / (length - 2);
      final x = 30.0 + _setValue(180 * math.cos(theta), i, lastItem);
      final y = 60.0 + _setValue(180 * math.sin(theta), i, lastItem);
      context.paintChild(i, transform: Matrix4.identity()..translate(x, y, 0));
    }
  }

  double _setValue(dynamic val, int i, int lastItem) =>
      i == lastItem ? 0.0 : val * controller.value;

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
