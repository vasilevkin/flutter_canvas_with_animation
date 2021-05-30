import 'package:flutter/material.dart';
import 'package:flutter_canvas_with_animation/app/paints.dart';

class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter({required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    var path = Path();
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    canvas.drawPath(path, Paints.paintGreen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
