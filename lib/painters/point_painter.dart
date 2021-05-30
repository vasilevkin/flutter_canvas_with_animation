import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvas_with_animation/app/paints.dart';

class PointPainter extends CustomPainter {
  final double radius;
  final double angle;

  PointPainter({required this.radius, required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text:
          '( ${(radius * math.cos(angle)).round()} ) , ( ${(radius * math.sin(angle)).round()} )',
      style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 20),
    );

    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);

    textPainter.layout(
      minWidth: 0,
      maxWidth: 200,
    );

    var path = Path();
    var center = Offset(size.width / 2, size.height / 2);

    path.moveTo(center.dx, center.dy);

    var pointOnCircle = Offset(
      radius * math.cos(angle) + center.dx,
      radius * math.sin(angle) + center.dy,
    );

    var textOffset = Offset(0, 0);

    if (math.cos(angle) < 0.0) {
      if (math.sin(angle) < 0.0) {
        textOffset = Offset(-170, -50);
      } else {
        textOffset = Offset(-150, 50);
      }
    } else {
      if (math.sin(angle) < 0.0) {
        textOffset = Offset(50, -50);
      } else {
        textOffset = Offset(50, 50);
      }
    }

    textPainter.paint(canvas, pointOnCircle + textOffset);

    canvas.drawCircle(center, -radius * math.cos(angle), Paints.paintBrown);
    canvas.drawCircle(center, -radius * math.sin(angle), Paints.paintOrange);

    canvas.drawCircle(center, radius * math.cos(angle), Paints.paintBrown);
    canvas.drawCircle(center, radius * math.sin(angle), Paints.paintOrange);

    path.lineTo(pointOnCircle.dx, pointOnCircle.dy);
    path.lineTo(pointOnCircle.dx, center.dy);

    path.close();
    canvas.drawPath(path, Paints.paintBlue);

    canvas.drawCircle(pointOnCircle, 20, Paints.paintRed);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
