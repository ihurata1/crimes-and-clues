// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:CrimesAndClues/components/animations/blood_animation.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';
import 'package:CrimesAndClues/suspects/view/widgets/detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuspectsScreen extends StatefulWidget {
  const SuspectsScreen({super.key});

  @override
  State<SuspectsScreen> createState() => _SuspectsScreenState();
}

class _SuspectsScreenState extends State<SuspectsScreen> {
  List<SuspectModel> suspectsList = [
    SuspectModel(
        name: "talha",
        age: "26",
        jobTitle: "yazılım",
        relavence: "iş arkadaşı",
        statement:
            "Ben, Talha Hürata, cinayet suçlamalarını reddediyorum. O gece evimdeydim ve hiçbir yere gitmedim. Ev arkadaşım Mehmet de bunu doğrulayabilir. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım.SONNNNNNNNNNNNNNNNNNNNNN",
        isGuilty: false,
        image: "assets/suspects/man2.png"),
    SuspectModel(name: "zeynep", age: "23", jobTitle: "mimar", relavence: "arkadaşı", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/woman.png"),
    SuspectModel(name: "zehra", age: "20", jobTitle: "öğrenci", relavence: "kardeşi", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/woman2.png"),
    SuspectModel(name: "ibrahim", age: "26", jobTitle: "öğrenci", relavence: "yok", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/man.png"),
    SuspectModel(
        name: "talha",
        age: "26",
        jobTitle: "yazılım",
        relavence: "iş arkadaşı",
        statement:
            "Ben, Talha Hürata, cinayet suçlamalarını reddediyorum. O gece evimdeydim ve hiçbir yere gitmedim. Ev arkadaşım Mehmet de bunu doğrulayabilir. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım.SONNNNNNNNNNNNNNNNNNNNNN",
        isGuilty: false,
        image: "assets/suspects/man2.png"),
    SuspectModel(name: "zeynep", age: "23", jobTitle: "mimar", relavence: "arkadaşı", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/woman.png"),
    SuspectModel(name: "zehra", age: "20", jobTitle: "öğrenci", relavence: "kardeşi", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/woman2.png"),
    SuspectModel(name: "ibrahim", age: "26", jobTitle: "öğrenci", relavence: "yok", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/man.png"),
    SuspectModel(
        name: "talha",
        age: "26",
        jobTitle: "yazılım",
        relavence: "iş arkadaşı",
        statement:
            "Ben, Talha Hürata, cinayet suçlamalarını reddediyorum. O gece evimdeydim ve hiçbir yere gitmedim. Ev arkadaşım Mehmet de bunu doğrulayabilir. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım. Olay yerinde bulunan parmak izlerim, daha önce orada bulunmamdan kaynaklanıyor olabilir. Ben masumum ve bu konuda hukuki yardım alacağım.SONNNNNNNNNNNNNNNNNNNNNN",
        isGuilty: false,
        image: "assets/suspects/man2.png"),
    SuspectModel(name: "zeynep", age: "23", jobTitle: "mimar", relavence: "arkadaşı", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/woman.png"),
    SuspectModel(name: "zehra", age: "20", jobTitle: "öğrenci", relavence: "kardeşi", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/woman2.png"),
    SuspectModel(name: "ibrahim", age: "26", jobTitle: "öğrenci", relavence: "yok", statement: "ben yapmadım", isGuilty: false, image: "assets/suspects/man.png"),
  ];

  suspectDetailDialog(int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuspectsDetailWidget(suspectsList: suspectsList, index: index);
      },
    );
  }

  Widget suspectCard(int index) {
    return GestureDetector(
      onTap: () => suspectDetailDialog(index),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: AppColor.investingDarkRed),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.ivoryWhite, AppColor.investingBeige],
            ),
            borderRadius: BorderRadius.circular(20)
            /*
           boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // gölgelerin pozisyonunu ayarlar
            ),
          ], */
            ),
        margin: EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: AppColor.investingDarkRed),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    suspectsList[index].image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      suspectsList[index].name!.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                        fontSize: 16,
                        color: AppColor.gunmetalGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      suspectsList[index].age!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                        fontSize: 14,
                        color: AppColor.gunmetalGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      suspectsList[index].relavence!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                        fontSize: 14,
                        color: AppColor.gunmetalGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _suspectsGrid {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 8 / 12,
      children: List.generate(
        suspectsList.length,
        (index) {
          return suspectCard(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      firstColor: AppColor.investingBrown,
      secondColor: AppColor.investingBrown.withOpacity(0.4),
      thirdColor: AppColor.investingBrown.withOpacity(0.2),
      child: Center(
        child: _suspectsGrid,
      ),
    );
  }
}
