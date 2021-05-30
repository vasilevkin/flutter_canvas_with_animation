import 'package:flutter/material.dart';
import 'package:flutter_canvas_with_animation/screens/home_tabbar_screen.dart';

class CanvasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing on canvas with animation',
      home: HomeTabBarScreen(),
    );
  }
}
