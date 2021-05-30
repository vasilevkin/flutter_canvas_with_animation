import 'dart:ui';

import 'package:flutter/material.dart';

class Paints {
  static var paintBrown = Paint()
    ..color = Colors.brown
    ..strokeWidth = 7
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

  static var paintOrange = Paint()
    ..color = Colors.orange
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

  static var paintRed = Paint()
    ..color = Colors.red
    ..strokeWidth = 17
    ..strokeCap = StrokeCap.butt
    ..style = PaintingStyle.stroke;

  static var paintGreen = Paint()
    ..color = Colors.green
    ..strokeWidth = 27
    ..strokeCap = StrokeCap.square
    ..style = PaintingStyle.stroke;

  static var paintBlue = Paint()
    ..color = Colors.blue
    ..strokeWidth = 15
    ..strokeCap = StrokeCap.butt
    ..style = PaintingStyle.stroke;

  static var paintYellow = Paint()
    ..color = Colors.yellow
    ..strokeWidth = 35
    ..strokeCap = StrokeCap.butt
    ..style = PaintingStyle.fill;
}
