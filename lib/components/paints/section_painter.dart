import 'package:CrimesAndClues/constants/colors.dart';
import 'package:flutter/material.dart';

class AppSectionPainter extends CustomPainter {
  Color firstColor;
  Color secondColor;
  Color thirdColor;

  AppSectionPainter(this.firstColor, this.secondColor, this.thirdColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    paint.color = secondColor;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(size.width * 0.75, 0);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.2, size.width * 0.5, size.height);
    path.lineTo(0, size.height);
    path.close();

    paint.color = firstColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
