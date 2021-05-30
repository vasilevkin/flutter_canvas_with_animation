import 'package:flutter/material.dart';
import 'package:flutter_canvas_with_animation/screens/animation_screen.dart';

import 'controls_screen.dart';
import 'simple_screen.dart';

class HomeTabBarScreen extends StatefulWidget {
  @override
  _HomeTabBarScreenState createState() => _HomeTabBarScreenState();
}

class _HomeTabBarScreenState extends State<HomeTabBarScreen> {
  int _currentIndex = 2;
  final List _children = [
    SimpleScreen(),
    ControlsScreen(),
    AnimationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw on canvas'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_outlined), label: 'Simple'),
          BottomNavigationBarItem(
              icon: Icon(Icons.control_camera), label: 'Controls'),
          BottomNavigationBarItem(
              icon: Icon(Icons.animation), label: 'Animation'),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
