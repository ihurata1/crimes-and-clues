import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/helpers/device_info/device_info.dart';
import 'package:CrimesAndClues/helpers/navigator/navigator.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuspectsDetailWidget extends StatelessWidget {
  const SuspectsDetailWidget({
    super.key,
    required this.suspectsList,
    required this.index,
  });

  final List<SuspectModel> suspectsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => AppNavigator.pop(),
            child: Container(
              color: Colors.transparent,
              height: DeviceInfo.height(100),
            ),
          ),
          Center(
            child: Container(
              height: DeviceInfo.height(90),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColor.white, AppColor.investingBeige],
                ),
                border: Border.all(width: 2.0),
              ),
              margin: EdgeInsets.all(DeviceInfo.width(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: DeviceInfo.height(40),
                    width: DeviceInfo.width(85),
                    margin: const EdgeInsets.all(4.0),
                    //decoration: BoxDecoration(border: Border.all(width: 2.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        suspectsList[index].image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: DeviceInfo.height(2)),
                            width: DeviceInfo.width(80),
                            child: Text(
                              "İsim: ${suspectsList[index].name!.toUpperCase()}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoMono(
                                fontSize: 16,
                                color: AppColor.gunmetalGray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: DeviceInfo.height(2)),
                            width: DeviceInfo.width(80),
                            child: Text(
                              "Yaş: ${suspectsList[index].age!}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                color: AppColor.gunmetalGray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: DeviceInfo.height(2)),
                            width: DeviceInfo.width(80),
                            child: Text(
                              "Kurbanla İlişkisi: ${suspectsList[index].relavence!}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                color: AppColor.gunmetalGray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: DeviceInfo.height(2), bottom: DeviceInfo.height(2)),
                            width: DeviceInfo.width(80),
                            child: Text(
                              "İfadesi: ${suspectsList[index].statement!}",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                color: AppColor.gunmetalGray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
