// ignore_for_file: prefer_const_constructors

import 'package:CrimesAndClues/clues/view/clues.dart';
import 'package:CrimesAndClues/components/animations/blood_animation.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/components/paints/background_paint.dart';
import 'package:CrimesAndClues/components/paints/section_painter.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/constants/navigator/page_route_effect.dart';
import 'package:CrimesAndClues/helpers/device_info/device_info.dart';
import 'package:CrimesAndClues/helpers/navigator/navigator.dart';
import 'package:CrimesAndClues/suspects/view/suspects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget navigationField({required VoidCallback ontap, required Color firstColor, required Color secondColor, required String title, int flex = 1, bool isCase = false, required IconData icon}) {
    if (isCase) {
      return Expanded(
        flex: flex,
        child: GestureDetector(
          onTap: ontap,
          child: Container(
            margin: EdgeInsets.all(DeviceInfo.width(3)),
            width: DeviceInfo.width(100),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CustomPaint(
                painter: BloodPainter(progress: 1, bgColor: AppColor.antiqueWhite),
                child: Align(
                  alignment: const Alignment(0.0, 0.5),
                  child: Text(
                    title.toUpperCase(),
                    style: GoogleFonts.caveat(
                      fontSize: 34,
                      color: AppColor.gunmetalGray,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: DeviceInfo.width(100),
          decoration: BoxDecoration(border: Border.all(width: 0.05, color: AppColor.gunmetalGray)),
          child: CustomPaint(
            painter: AppSectionPainter(firstColor, secondColor, Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Text(
                    title.toUpperCase(),
                    style: GoogleFonts.caveat(
                      fontSize: 26,
                      color: AppColor.gunmetalGray,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [AppColor.investingBrown, AppColor.white],
          ),
        ),
        width: DeviceInfo.width(100),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            navigationField(
              ontap: () => AppNavigator.push(screen: SuspectsScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.investingBeige,
              secondColor: AppColor.antiqueWhite,
              title: "The Murder",
              flex: 2,
              isCase: true,
              icon: Icons.abc,
            ),
            navigationField(
              ontap: () => AppNavigator.push(screen: SuspectsScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.darkGray,
              title: "suspects",
              icon: Icons.supervisor_account_rounded,
            ),
            navigationField(
              ontap: () => AppNavigator.push(screen: CluesScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.bloodRedLight,
              title: "clues",
              icon: Icons.search_rounded,
            ),
            navigationField(
              ontap: () => AppNavigator.push(screen: SuspectsScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.detectiveGreen,
              title: "ABC",
              icon: Icons.abc,
            ),
            navigationField(
              ontap: () => AppNavigator.push(screen: SuspectsScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.midnightBlue,
              title: "ABC",
              icon: Icons.abc,
            ),
          ],
        ),
      ),
    );
  }
}
