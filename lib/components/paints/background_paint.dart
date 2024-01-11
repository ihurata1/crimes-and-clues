import 'package:CrimesAndClues/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBackgroundPainter extends CustomPainter {
  Color? firstColor;
  Color? secondColor;
  Color? thirdColor;

  AppBackgroundPainter({this.firstColor = AppColor.investingBeige, this.secondColor = AppColor.investingLightBrown, this.thirdColor = AppColor.investingBrown});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = thirdColor!;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.50, size.width * 0.70, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.85, size.height * 0.65, size.width, size.height * 0.65);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = secondColor!;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.05, size.height * 0.40, size.width * 0.30, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.70, size.height * 0.25, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = firstColor!;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
