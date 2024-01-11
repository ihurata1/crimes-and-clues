// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:CrimesAndClues/components/paints/background_paint.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  AppContainer({
    super.key,
    required this.child,
    this.bgColor = Colors.white,
    this.firstColor = Colors.white,
    this.secondColor = Colors.white,
    this.thirdColor = Colors.white,
    this.isGradient = false,
  });

  final Widget child;
  Color bgColor;
  Color firstColor;
  Color secondColor;
  Color thirdColor;
  bool isGradient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgColor,
      body: SafeArea(
        /*top: false,
        bottom: false,*/
        child: CustomPaint(
          painter: AppBackgroundPainter(firstColor: firstColor, secondColor: secondColor, thirdColor: thirdColor),
          child: Container(
            child: child,
          ),
        ),
      ),
    );
  }
}
