import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_canvas_with_animation/painters/polygon_painter.dart';

class ControlsScreen extends StatefulWidget {
  @override
  _ControlsScreenState createState() => _ControlsScreenState();
}

class _ControlsScreenState extends State<ControlsScreen> {
  var _sides = 4.0;
  var _radius = 100.0;
  var _angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomPaint(
              painter:
                  PolygonPainter(sides: _sides, radius: _radius, angle: _angle),
              child: Container(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('Number of sides:'),
          ),
          Slider(
            value: _sides,
            min: 0.0,
            max: 20.0,
            label: _sides.toInt().toString(),
            divisions: 19,
            onChanged: (value) {
              setState(() {
                _sides = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('Size:'),
          ),
          Slider(
            value: _radius,
            min: 10.0,
            max: 500.0,
            label: _radius.toInt().toString(),
            onChanged: (value) {
              setState(() {
                _radius = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('Rotation:'),
          ),
          Slider(
            value: _angle,
            min: 0.0,
            max: math.pi,
            label: _angle.toInt().toString(),
            onChanged: (value) {
              setState(() {
                _angle = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
