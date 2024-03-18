// ignore_for_file: prefer_const_constructors

import 'package:CrimesAndClues/case/view/case.dart';
import 'package:CrimesAndClues/clues/view/clues.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/constants/navigator/page_route_effect.dart';
import 'package:CrimesAndClues/helpers/device_info/device_info.dart';
import 'package:CrimesAndClues/helpers/navigator/navigator.dart';
import 'package:CrimesAndClues/suspects/view/suspects.dart';
import 'package:CrimesAndClues/suspects/view/tempSuspect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget navigationField({
    required VoidCallback ontap,
    required Color firstColor,
    required Color secondColor,
    required String title,
    int flex = 1,
    bool isCase = false,
    required String imagePath,
    double padding = 0,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: DeviceInfo.width(100),
        child: Column(
          children: [
            Center(
              child: Container(
                height: DeviceInfo.width(36),
                width: DeviceInfo.width(36),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.antiqueWhite,
                  border: Border.all(width: 2.0, color: AppColor.redToLighter),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(3, 3), // gölgelerin pozisyonunu ayarlar
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(DeviceInfo.width(padding)),
                  child: Image.asset(
                    imagePath,
                    height: DeviceInfo.width(2),
                    width: DeviceInfo.width(2),
                  ),
                ),
              ),
            ),
            SizedBox(height: DeviceInfo.height(1)),
            Center(
              child: Text(
                title.toUpperCase(),
                style: GoogleFonts.robotoMono(
                  fontSize: 22,
                  color: AppColor.gunmetalGray,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _title {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: DeviceInfo.height(4)),
        child: Text(
          "Case Title",
          style: GoogleFonts.robotoMono(
            fontSize: 44,
            color: AppColor.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget get _body {
    return Padding(
      padding: EdgeInsets.only(top: DeviceInfo.height(15)),
      child: Center(
        child: GridView.count(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 4 / 4,
          children: [
            navigationField(
              ontap: () => AppNavigator.push(screen: CaseScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.detectiveGreen,
              title: "case",
              imagePath: "assets/case/victim.png",
            ),
            navigationField(
              ontap: () => AppNavigator.push(screen: SuspectsScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.darkGray,
              title: "suspects",
              imagePath: "assets/suspects/suspect.png",
            ),
            navigationField(
              ontap: () => AppNavigator.push(screen: CluesScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.bloodRedLight,
              title: "clues",
              imagePath: "assets/clues/clue.png",
              padding: 5,
            ),
            navigationField(
              ontap: () => AppNavigator.push(screen: SuspectsScreen(), effect: AppRouteEffect.rightToLeft),
              firstColor: AppColor.antiqueWhite,
              secondColor: AppColor.midnightBlue,
              title: "ABC",
              padding: 4,
              imagePath: "assets/others/questionmark.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget get _backgroundDecoration {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: DeviceInfo.height(13), left: DeviceInfo.width(10)),
          child: Center(child: Image.asset("assets/others/blood.png", color: AppColor.bloodRed)),
        ),
        Padding(
          padding: EdgeInsets.only(top: DeviceInfo.height(35), right: DeviceInfo.width(40)),
          child: Center(child: Image.asset("assets/others/bloodtwo.png", color: AppColor.bloodRed)),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement Dispose,
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      isGradient: true,
      child: Stack(
        children: [
          _title,
          _backgroundDecoration,
          _body,
        ],
      ),
    );
  }
}
