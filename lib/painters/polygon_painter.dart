import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter_canvas_with_animation/app/paints.dart';

class PolygonPainter extends CustomPainter {
  final double sides;
  final double radius;
  final double angle;

  PolygonPainter(
      {required this.sides, required this.radius, required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var angleInside = (math.pi * 2) / sides;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(angle), radius * math.sin(angle));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(angle + angleInside * i) + center.dx;
      double y = radius * math.sin(angle + angleInside * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, Paints.paintRed);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
