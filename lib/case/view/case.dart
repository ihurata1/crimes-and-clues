// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:CrimesAndClues/autopsy/view/autopsy.dart';
import 'package:CrimesAndClues/components/animations/bg_animation.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/constants/navigator/page_route_effect.dart';
import 'package:CrimesAndClues/helpers/device_info/device_info.dart';
import 'package:CrimesAndClues/helpers/navigator/navigator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaseScreen extends StatefulWidget {
  const CaseScreen({super.key});

  @override
  State<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends State<CaseScreen> {
  late bool _isAnimFinished;

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
      child: Padding(
        padding: EdgeInsets.only(top: DeviceInfo.height(6)),
        child: DottedBorder(
          strokeWidth: 2.0,
          strokeCap: StrokeCap.square,
          color: AppColor.paperWintageLight,
          dashPattern: const <double>[6, 12],
          child: Container(
            height: DeviceInfo.height(80),
            width: DeviceInfo.width(90),
            color: AppColor.paperWintageLightest,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "X Cinayeti",
                    style: GoogleFonts.robotoMono(
                      fontSize: 32,
                      color: AppColor.bloodRed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(DeviceInfo.height(1)),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(width: 1.0, color: AppColor.paperWintageDarkest)),
                        child: Image.asset(
                          "assets/suspects/victimw.png",
                          height: DeviceInfo.height(25),
                          width: DeviceInfo.height(25),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kurbanın adı: Senna",
                              style: GoogleFonts.robotoMono(
                                fontSize: 20,
                                color: AppColor.gunmetalGray,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Yaşı: 21",
                              style: GoogleFonts.robotoMono(
                                fontSize: 18,
                                color: AppColor.gunmetalGray,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Nerede: Evinde ölü bulundu",
                              style: GoogleFonts.robotoMono(
                                fontSize: 22,
                                color: AppColor.gunmetalGray,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: DeviceInfo.width(100),
                  height: DeviceInfo.height(30),
                  padding: EdgeInsets.all(DeviceInfo.width(2)),
                  child: DottedBorder(
                    strokeWidth: 2.0,
                    strokeCap: StrokeCap.square,
                    color: AppColor.paperWintageLight,
                    dashPattern: const <double>[6, 12],
                    child: RawScrollbar(
                      thumbColor: AppColor.bloodRedLight,
                      thickness: 4.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: AppColor.antiqueWhite,
                          child: Text(
                            "21 yaşındaki Senna, kendi evinde trajik bir şekilde hayatını kaybetti. Olay yerine gelen yetkililer, genç kadının cansız bedenini evinde buldu. Bu beklenmedik ve şok edici olay, Senna’nın yakın çevresini ve ailesini derinden üzdü. Soruşturma devam ederken, Senna’nın hayatını kimin veya neyin aldığı henüz belirsizliğini koruyor. Bu trajik olayın aydınlatılması için emniyet güçleri titiz bir çalışma yürütüyor.",
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: AppColor.gunmetalGray,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                _autopsyField,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _autopsyField {
    return GestureDetector(
      onTap: () => AppNavigator.push(screen: AutopsyScreen(), effect: AppRouteEffect.rightToLeft),
      child: Container(
        width: DeviceInfo.width(100),
        height: DeviceInfo.height(15),
        padding: EdgeInsets.all(DeviceInfo.width(2)),
        child: DottedBorder(
          strokeWidth: 2.0,
          strokeCap: StrokeCap.square,
          color: AppColor.seafoamGreenDarkest,
          dashPattern: const <double>[6, 12],
          child: Container(
            width: DeviceInfo.width(100),
            height: DeviceInfo.height(15),
            padding: const EdgeInsets.all(8.0),
            color: AppColor.antiqueWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Otopsi raporunu görüntüle",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoMono(
                      fontSize: 16,
                      color: AppColor.seafoamGreenDarkest,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/icons/otopsi.png",
                    color: AppColor.seafoamGreenDark,
                  ),
                )
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
      child: Stack(
        children: [
          Center(
            child: AnimatedBackground(
              availableScreenRatio: 2.0,
              firstColor: <Color>[
                AppColor.paperWintageDarkest,
                AppColor.white,
                AppColor.paperWintageDarkest,
              ],
              secondColor: <Color>[
                Color.fromARGB(255, 66, 46, 0),
                AppColor.paperWintageLightest,
                Color.fromARGB(255, 43, 34, 3),
              ],
              topSecondColor: <Color>[
                Color.fromARGB(255, 66, 53, 0),
                AppColor.paperWintageDark,
                Color.fromARGB(255, 66, 53, 0),
              ],
              thirdColor: <Color>[
                AppColor.paperWintageDark,
                AppColor.white,
                AppColor.paperWintageDark,
              ],
            ),
          ),
          _isAnimFinished ? _body : Container(),
        ],
      ),
    );
  }
}


/// 21 yaşındaki Senna, kendi evinde trajik bir şekilde hayatını kaybetti. Olay yerine gelen yetkililer, genç kadının cansız bedenini evinde buldu. Bu beklenmedik ve şok edici olay, Senna’nın yakın çevresini ve ailesini derinden üzdü. Soruşturma devam ederken, Senna’nın hayatını kimin veya neyin aldığı henüz belirsizliğini koruyor. Bu trajik olayın aydınlatılması için emniyet güçleri titiz bir çalışma yürütüyor.///