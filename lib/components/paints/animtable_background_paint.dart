// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:CrimesAndClues/constants/colors.dart';
import 'package:flutter/material.dart';

class AppAnimetableBackgroundPainter extends CustomPainter {
  List<Color>? firstColor;
  List<Color>? topSecondColor;
  List<Color>? secondColor;
  List<Color>? thirdColor;
  double? progress;
  bool? isOneColor;
  double multiplier = 0.07;

  AppAnimetableBackgroundPainter({this.progress, this.isOneColor = false, this.topSecondColor, this.firstColor, this.secondColor, this.thirdColor});

  double get animateValue {
    return (progress! * multiplier);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();

    //second red
    path = Path();
    path.lineTo(0, size.height * (0.25 - animateValue));
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * (0.14 - animateValue),
      size.width * 0.35,
      size.height * (0.22 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * (0.26 - animateValue),
      size.width * 0.65,
      size.height * (0.23 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * (0.14 - animateValue),
      size.width,
      size.height * (0.22 - animateValue),
    );
    path.lineTo(size.width, 0);

    path.close();

    final Gradient secondGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: topSecondColor == null
          ? <Color>[
              AppColor.redToDarker,
              AppColor.redToDarkest,
            ]
          : topSecondColor!,
    );

// Gradyanı boyaya uygulayın
    paint.shader = secondGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    paint.color = AppColor.redToDarker;
    canvas.drawPath(path, paint);

    //first red
    path = Path();
    path.lineTo(0, size.height * (0.15 - animateValue));
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * (0.10 - animateValue),
      size.width * 0.35,
      size.height * (0.18 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * (0.22 - animateValue),
      size.width * 0.65,
      size.height * (0.18 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * (0.10 - animateValue),
      size.width,
      size.height * (0.15 - animateValue),
    );
    path.lineTo(size.width, 0);

    path.close();

    final Gradient firstGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: firstColor == null
          ? <Color>[
              AppColor.bloodRed,
              AppColor.white,
              AppColor.bloodRed,
            ]
          : firstColor!,
    );

// Gradyanı boyaya uygulayın
    paint.shader = firstGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    paint.color = AppColor.bloodRed;
    canvas.drawPath(path, paint);

    //third red
    path = Path();

    path.moveTo(0, size.height * (0.25 - animateValue));
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * (0.15 - animateValue),
      size.width * 0.2,
      size.height * (0.18 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.30,
      size.height * (0.21 - animateValue),
      size.width * 0.40,
      size.height * (0.20 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.60,
      size.height * (0.15 - animateValue),
      size.width * 0.70,
      size.height * (0.20 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (0.20 - animateValue),
      size.width * 0.83,
      size.height * (0.17 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * (0.14 - animateValue),
      size.width,
      size.height * (0.18 - animateValue),
    );

    path.lineTo(size.width, size.height * (0.35 - animateValue)); // Yüksekliği burada ayarlayın
    path.lineTo(0, size.height * (0.35 - animateValue)); // Yüksekliği burada ayarlayın

    path.close();

    final Gradient thirdGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
      colors: thirdColor == null
          ? <Color>[
              AppColor.shadeOfRedFf0000,
              AppColor.white,
              AppColor.shadeOfRedFf0000,
            ]
          : thirdColor!,
    );

// Gradyanı boyaya uygulayın
    paint.shader = thirdGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);

    //fourth red
    path = Path();

    path.moveTo(0, size.height * (0.27 - animateValue));
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * (0.22 - animateValue),
      size.width * 0.2,
      size.height * (0.24 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.30,
      size.height * (0.27 - animateValue),
      size.width * 0.40,
      size.height * (0.24 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * (0.19 - animateValue),
      size.width * 0.62,
      size.height * (0.24 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.67,
      size.height * (0.26 - animateValue),
      size.width * 0.75,
      size.height * (0.24 - animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * (0.19 - animateValue),
      size.width,
      size.height * (0.22 - animateValue),
    );

    path.lineTo(size.width, size.height); // Yüksekliği burada ayarlayın

    path.lineTo(0, size.height); // Yüksekliği burada ayarlayın

    path.close();
    final Gradient fourthGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        AppColor.antiqueWhite,
        isOneColor! ? AppColor.antiqueWhite : AppColor.offWhiteDarkest,
      ],
    );

// Gradyanı boyaya uygulayın
    paint.shader = fourthGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);

    //BOTTOM **************************************************************************************************

    //firstlayer
    path = Path();
    path.moveTo(0, size.height * (0.85 + animateValue));
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * (0.90 + animateValue),
      size.width * 0.35,
      size.height * (0.82 + animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * (0.78 + animateValue),
      size.width * 0.65,
      size.height * (0.82 + animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * (0.90 + animateValue),
      size.width,
      size.height * (0.85 + animateValue),
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

// Gradyanı boyaya uygulayın
    final Gradient bottomSecondGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: secondColor == null
          ? <Color>[
              AppColor.redToDarkest,
              AppColor.shadeOfRedFfbaba,
              AppColor.redToDarkest,
            ]
          : secondColor!,
    );
    paint.shader = bottomSecondGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);

    //secondlayer
    path = Path();
    path.moveTo(0, size.height * (0.90 + animateValue));
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * (0.93 + animateValue),
      size.width * 0.35,
      size.height * (0.85 + animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * (0.81 + animateValue),
      size.width * 0.65,
      size.height * (0.85 + animateValue),
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * (0.93 + animateValue),
      size.width,
      size.height * (0.86 + animateValue),
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
