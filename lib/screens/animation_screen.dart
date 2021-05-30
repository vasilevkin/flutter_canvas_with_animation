import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvas_with_animation/painters/circle_painter.dart';
import 'package:flutter_canvas_with_animation/painters/point_painter.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  var _radius = 200.0;
  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

    animation = _rotationTween.animate(controller!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller?.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller?.forward();
        }
      });

    controller?.forward();
  }

  @override
  void dispose() {
    controller?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomPaint(
            foregroundPainter:
                PointPainter(radius: _radius, angle: animation!.value),
            painter: CirclePainter(radius: _radius),
            child: Container(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text('Size:'),
        ),
        Slider(
          value: _radius,
          min: 10.0,
          max: MediaQuery.of(context).size.height,
          onChanged: (value) {
            setState(() {
              _radius = value;
            });
          },
        ),
      ],
    ));
  }
}
