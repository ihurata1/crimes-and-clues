// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:CrimesAndClues/clues/model/clue.dart';
import 'package:CrimesAndClues/components/animations/bg_animation.dart';
import 'package:CrimesAndClues/components/animations/blood_animation.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/helpers/device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CluesScreen extends StatefulWidget {
  const CluesScreen({super.key});

  @override
  State<CluesScreen> createState() => _CluesScreenState();
}

class _CluesScreenState extends State<CluesScreen> {
  late bool _isAnimFinished;
  final List<ClueHiveModel> _clueList = [
    ClueHiveModel(value: "Çakı", detail: "Kurbana saplanmış halde bulundu"),
    ClueHiveModel(value: "Çanta", detail: "Kurbandan 50 metre ileride bulundu içi boş"),
  ];

  @override
  void initState() {
    setState(() {
      _isAnimFinished = false;
    });
    Future.delayed(Duration(seconds: 1, milliseconds: 500)).then((value) {
      setState(() => _isAnimFinished = true);
    });
    super.initState();
  }

  Widget get _body {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: DeviceInfo.width(2), right: DeviceInfo.width(2), top: DeviceInfo.height(6)),
        height: DeviceInfo.height(72),
        child: GridView.count(
          crossAxisCount: 2,
          physics: BouncingScrollPhysics(),
          mainAxisSpacing: DeviceInfo.width(2.0),
          crossAxisSpacing: DeviceInfo.width(2.0),
          childAspectRatio: 16 / 9,
          children: List.generate(_clueList.length, (index) => _clueCard(index)),
        ),
      ),
    );
  }

  Widget _clueCard(index) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1.0, color: AppColor.gunmetalGray)),
          margin: EdgeInsets.only(top: DeviceInfo.width(5)),
          child: Center(
            child: Text(
              _clueList[index].value!,
              style: GoogleFonts.robotoMono(
                fontSize: 24,
                color: AppColor.gunmetalGray,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: AppColor.antiqueWhite),
          child: Image.asset(
            "assets/clues/clue.png",
            height: DeviceInfo.width(10),
            width: DeviceInfo.width(10),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Stack(
        children: [
          Center(
            child: AnimatedBackground(
              isOneColor: true,
              availableScreenRatio: 1.5,
              firstColor: <Color>[
                AppColor.yellowDark,
                AppColor.white,
                AppColor.yellowDark,
              ],
              secondColor: <Color>[
                AppColor.black,
                AppColor.yellowDark,
                AppColor.black,
              ],
              topSecondColor: <Color>[
                AppColor.black,
                AppColor.black,
              ],
              thirdColor: <Color>[
                AppColor.yellowDark,
                AppColor.white,
                AppColor.yellowDark,
              ],
            ),
          ),
          _isAnimFinished ? _body : Container(),
        ],
      ),
    );
  }
}
