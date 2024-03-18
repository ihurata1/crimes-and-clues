// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, no_logic_in_create_state, must_be_immutable

import 'package:CrimesAndClues/components/paints/animtable_background_paint.dart';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  bool? showBacgroundColor;
  List<Color>? firstColor;
  List<Color>? topSecondColor;
  List<Color>? secondColor;
  List<Color>? thirdColor;
  double availableScreenRatio;
  bool? isOneColor;

  AnimatedBackground({this.isOneColor = false, this.availableScreenRatio = 1.0, this.showBacgroundColor = true, this.firstColor, this.secondColor, this.thirdColor, this.topSecondColor});
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState(
      showBacgroundColor: showBacgroundColor,
      isOneColor: isOneColor,
      availableScreenRatio: availableScreenRatio,
      firstColor: firstColor,
      secondColor: secondColor,
      thirdColor: thirdColor,
      topSecondColor: topSecondColor);
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Color>? firstColor;
  List<Color>? topSecondColor;
  List<Color>? secondColor;
  List<Color>? thirdColor;
  double? availableScreenRatio;
  bool? isOneColor;
  bool? showBacgroundColor;
  _AnimatedBackgroundState({this.availableScreenRatio, this.isOneColor, this.showBacgroundColor, this.firstColor, this.secondColor, this.thirdColor, this.topSecondColor});

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: AppAnimetableBackgroundPainter(
            progress: _controller.value * availableScreenRatio!,
            firstColor: firstColor,
            secondColor: secondColor,
            thirdColor: thirdColor,
            isOneColor: isOneColor,
            topSecondColor: topSecondColor,
          ),
          child: Container(),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
