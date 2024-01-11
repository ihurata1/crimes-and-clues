// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AnimatedBlood extends StatefulWidget {
  bool? showBacgroundColor;
  AnimatedBlood({this.showBacgroundColor = true});
  @override
  _AnimatedBloodState createState() => _AnimatedBloodState(showBacgroundColor: showBacgroundColor);
}

class _AnimatedBloodState extends State<AnimatedBlood> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool? showBacgroundColor;
  _AnimatedBloodState({this.showBacgroundColor});

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: BloodPainter(progress: _controller.value, showBacgroundColor: showBacgroundColor),
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

class BloodPainter extends CustomPainter {
  final double progress;
  bool? showBacgroundColor;

  Color? bgColor;

  BloodPainter({required this.progress, this.bgColor = AppColor.white, this.showBacgroundColor = true});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    paint = Paint()..color = showBacgroundColor! ? bgColor! : bgColor!.withOpacity(0); // İstediğiniz rengi seçin
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
    //bg end
    path = Path();
    path.lineTo(0, size.height * 0.65 * progress);
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.70 * progress,
      size.width * 0.17,
      size.height * 0.90 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.20,
      size.height * progress,
      size.width * 0.25,
      size.height * 0.90 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.40,
      size.height * 0.50 * progress,
      size.width * 0.50,
      size.height * 0.70 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.60,
      size.height * 0.85 * progress,
      size.width * 0.75,
      size.height * 0.2 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.90 * progress,
      size.width,
      size.height * 0.30 * progress,
    );

    path.lineTo(size.width, 0);

    path.close();

    paint.color = AppColor.bloodRed.withOpacity(0.2);

    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.20 * progress);
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.50 * progress,
      size.width * 0.15,
      size.height * 0.30 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.20,
      size.height * 0.25 * progress,
      size.width * 0.15,
      size.height * 0.30 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.70 * progress,
      size.width * 0.50,
      size.height * 0.50 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.55,
      size.height * 0.25 * progress,
      size.width * 0.75,
      size.height * 0.45 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.63 * progress,
      size.width,
      size.height * 0.30 * progress,
    );
    path.lineTo(size.width, 0);
    path.close();

    paint.color = AppColor.bloodRedLight;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.45 * progress);
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.25 * progress,
      size.width * 0.22,
      size.height * 0.40 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.60 * progress,
      size.width * 0.40,
      size.height * 0.45 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.52,
      size.height * 0.20 * progress,
      size.width * 0.65,
      size.height * 0.40 * progress,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55 * progress,
      size.width,
      size.height * 0.30 * progress,
    );
    path.lineTo(size.width, 0);
    path.close();

    paint.color = AppColor.bloodRed;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BloodPainter oldDelegate) => oldDelegate.progress != progress;
}
