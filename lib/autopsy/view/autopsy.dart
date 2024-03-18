// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:CrimesAndClues/components/animations/bg_animation.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/helpers/device_info/device_info.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutopsyScreen extends StatefulWidget {
  const AutopsyScreen({super.key});

  @override
  State<AutopsyScreen> createState() => _AutopsyScreenState();
}

class _AutopsyScreenState extends State<AutopsyScreen> {
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
    return Padding(
      padding: EdgeInsets.only(top: DeviceInfo.height(6)),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/autopsy/woman_autopsy.png",
              height: DeviceInfo.height(50),
              width: DeviceInfo.height(50),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: DeviceInfo.width(90),
            height: DeviceInfo.height(35),
            child: RawScrollbar(
              thumbColor: AppColor.seafoamGreenLighter,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              thumbVisibility: true,
              thickness: 4.0,
              child: SingleChildScrollView(
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      """
Özet:
- Kişinin ölümü, kalp krizi nedeniyle gerçekleşmiştir.

Klinik Bilgiler:
- Kişi, 45 yaşında erkek bir hastadır.
- Son 6 ayda, yüksek tansiyon ve diyabet hastalıkları ile ilgili tedavi görmüştür.
- Son 24 saatte, göğüs ağrısı şikayeti ile hastaneye başvurmuştur.

Otopsi Bulguları:
- Kişinin vücudunda herhangi bir dış yaralanma veya travma belirtisi yoktur.
- Kalp, normalden daha büyük görünmektedir.
- Kalp kasında, kan akışını engelleyen bir tıkanıklık tespit edilmiştir.

Patolojik Bulgular:
- Kalp kasında, kan akışını engelleyen bir tıkanıklık tespit edilmiştir.

Ölüm Nedeni:
- Kişinin ölümü, kalp krizi nedeniyle gerçekleşmiştir.""",
                      textStyle: GoogleFonts.robotoMono(
                        fontSize: 14,
                        color: AppColor.gunmetalGray,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
                AppColor.seafoamGreenDarkest,
                AppColor.white,
                AppColor.seafoamGreenDarkest,
              ],
              secondColor: <Color>[
                Color.fromARGB(255, 0, 66, 51),
                AppColor.seafoamGreenLightest,
                Color.fromARGB(255, 0, 66, 51),
              ],
              topSecondColor: <Color>[
                Color.fromARGB(255, 0, 66, 54),
                AppColor.seafoamGreenDark,
                Color.fromARGB(255, 0, 66, 54),
              ],
              thirdColor: <Color>[
                AppColor.seafoamGreenDark,
                AppColor.white,
                AppColor.seafoamGreenDark,
              ],
            ),
          ),
          _isAnimFinished ? _body : Container(),
        ],
      ),
    );
  }
}
