import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_canvas_with_animation/app/paints.dart';

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // line
    Offset startPoint = Offset(0, size.height / 2 + 300);
    Offset endPoint = Offset(size.width, size.height / 2 + 300);
    canvas.drawLine(startPoint, endPoint, Paints.paintBrown);

    var pathLine = Path();
    pathLine.moveTo(20, size.height / 2 - 50 + 300);
    pathLine.lineTo(size.width - 20, size.height / 2 - 50 + 300);
    canvas.drawPath(pathLine, Paints.paintRed);

    // circle
    Offset center = Offset(size.width / 2, size.height / 2 + 70);
    canvas.drawCircle(center, 120, Paints.paintGreen);

    var pathCircle = Path();
    var circle = Rect.fromCircle(center: center, radius: 80);
    pathCircle.addOval(circle);
    canvas.drawPath(pathCircle, Paints.paintBlue);

    // square
    var sides = 4;
    var pathSquare = Path();
    var angleSquare = (math.pi * 2) / sides;
    var centerSqare = Offset(size.width / 2, size.height / 2 - 200);
    var radius = 100;
    var startPointSquare =
        Offset(radius * math.cos(0.0), radius * math.sin(0.0));

    pathSquare.moveTo(startPointSquare.dx + centerSqare.dx,
        startPointSquare.dy + centerSqare.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(angleSquare * i) + centerSqare.dx;
      double y = radius * math.sin(angleSquare * i) + centerSqare.dy;
      pathSquare.lineTo(x, y);
    }
    pathSquare.close();
    canvas.drawPath(pathSquare, Paints.paintYellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
