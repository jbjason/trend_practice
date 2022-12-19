import 'package:flutter/material.dart';

class FlowDelegate2 extends FlowDelegate {
  final Animation<double> controller;
  const FlowDelegate2({required this.controller}) : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    // ! Bottom FlowWidgets
    // ! just flow widgets with angle like-
    // ! topRight to bottomRight, left to rightBottom, 90 degree angle flow
    final size = context.size;
    final lastItem = context.childCount - 1;
    final xStart = size.width - 60;
    final yStart = size.height - 60;
    for (int i = lastItem; i >= 0; i--) {
      // getting child size
      final childSize = context.getChildSize(i)!.width;
      // +8.0 is padding between floatingIcons
      final dx = (childSize + 8.0) * i * controller.value;
      final x = xStart - dx;
      final y = yStart - dx;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
