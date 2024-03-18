// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:CrimesAndClues/constants/colors.dart';
import 'package:flutter/material.dart';

class AppHomeBackgroundPainter extends CustomPainter {
  Color? firstColor;
  Color? secondColor;
  Color? thirdColor;
  double? progress;

  AppHomeBackgroundPainter({this.progress, this.firstColor = AppColor.investingBeige, this.secondColor = AppColor.investingLightBrown, this.thirdColor = AppColor.investingBrown});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();

    //second red
    path = Path();
    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.24,
      size.width * 0.35,
      size.height * 0.32,
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.36,
      size.width * 0.65,
      size.height * 0.33,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.24,
      size.width,
      size.height * 0.32,
    );
    path.lineTo(size.width, 0);

    path.close();

    final Gradient secondGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        AppColor.redToDarker,
        AppColor.redToDarkest,
      ],
    );

// Gradyanı boyaya uygulayın
    paint.shader = secondGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    paint.color = AppColor.redToDarker;
    canvas.drawPath(path, paint);

    //first red
    path = Path();
    path.lineTo(0, size.height * 0.15);
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.10,
      size.width * 0.35,
      size.height * 0.18,
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.22,
      size.width * 0.65,
      size.height * 0.18,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.10,
      size.width,
      size.height * 0.15,
    );
    path.lineTo(size.width, 0);

    path.close();

    final Gradient firstGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        AppColor.bloodRed,
        AppColor.white,
        AppColor.bloodRed,
      ],
    );

// Gradyanı boyaya uygulayın
    paint.shader = firstGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    paint.color = AppColor.bloodRed;
    canvas.drawPath(path, paint);

    //third red
    path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.22,
      size.width * 0.2,
      size.height * 0.24,
    );
    path.quadraticBezierTo(
      size.width * 0.30,
      size.height * 0.26,
      size.width * 0.40,
      size.height * 0.22,
    );
    path.quadraticBezierTo(
      size.width * 0.60,
      size.height * 0.15,
      size.width * 0.70,
      size.height * 0.24,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.26,
      size.width * 0.83,
      size.height * 0.24,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.20,
      size.width,
      size.height * 0.20,
    );

    path.lineTo(size.width, size.height * 0.35); // Yüksekliği burada ayarlayın
    path.lineTo(0, size.height * 0.35); // Yüksekliği burada ayarlayın

    path.close();

    final Gradient thirdGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
      colors: <Color>[
        AppColor.shadeOfRedFf0000,
        AppColor.white,
        AppColor.shadeOfRedFf0000,
      ],
    );

// Gradyanı boyaya uygulayın
    paint.shader = thirdGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);

    //fourth red
    path = Path();

    path.moveTo(0, size.height * 0.30);
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.27,
      size.width * 0.2,
      size.height * 0.29,
    );
    path.quadraticBezierTo(
      size.width * 0.30,
      size.height * 0.31,
      size.width * 0.40,
      size.height * 0.27,
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.20,
      size.width * 0.62,
      size.height * 0.29,
    );
    path.quadraticBezierTo(
      size.width * 0.67,
      size.height * 0.31,
      size.width * 0.75,
      size.height * 0.29,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.25,
      size.width,
      size.height * 0.29,
    );

    path.lineTo(size.width, size.height); // Yüksekliği burada ayarlayın

    path.lineTo(0, size.height); // Yüksekliği burada ayarlayın

    path.close();
    final Gradient fourthGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        AppColor.antiqueWhite,
        AppColor.offWhiteDarkest,
      ],
    );

// Gradyanı boyaya uygulayın
    paint.shader = fourthGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);

    //BOTTOM **************************************************************************************************

    //firstlayer
    path = Path();
    path.moveTo(0, size.height * 0.85);
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.90,
      size.width * 0.35,
      size.height * 0.82,
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.78,
      size.width * 0.65,
      size.height * 0.82,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.90,
      size.width,
      size.height * 0.85,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

// Gradyanı boyaya uygulayın
    final Gradient bottomSecondGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        AppColor.redToDarkest,
        AppColor.shadeOfRedFfbaba,
        AppColor.redToDarkest,
      ],
    );
    paint.shader = bottomSecondGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);

    //secondlayer
    path = Path();
    path.moveTo(0, size.height * 0.90);
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.93,
      size.width * 0.35,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.81,
      size.width * 0.65,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.93,
      size.width,
      size.height * 0.86,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

// Gradyanı boyaya uygulayın
    paint.shader = firstGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
