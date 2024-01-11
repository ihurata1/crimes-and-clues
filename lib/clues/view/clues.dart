import 'package:CrimesAndClues/components/animations/blood_animation.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:flutter/material.dart';

class CluesScreen extends StatefulWidget {
  const CluesScreen({super.key});

  @override
  State<CluesScreen> createState() => _CluesScreenState();
}

class _CluesScreenState extends State<CluesScreen> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      firstColor: AppColor.investingBrown,
      secondColor: AppColor.investingBrown.withOpacity(0.4),
      thirdColor: AppColor.investingBrown.withOpacity(0.2),
      child: AnimatedBlood(showBacgroundColor: false),
    );
  }
}
