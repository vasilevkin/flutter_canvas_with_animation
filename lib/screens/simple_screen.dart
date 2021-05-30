import 'package:flutter/material.dart';

import '../painters/shape_painter.dart';

class SimpleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}
