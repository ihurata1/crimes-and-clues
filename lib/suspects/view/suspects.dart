// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:CrimesAndClues/components/animations/blood_animation.dart';
import 'package:CrimesAndClues/components/animations/bg_animation.dart';
import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/constants/app.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/constants/lists.dart';
import 'package:CrimesAndClues/helpers/device_info/device_info.dart';
import 'package:CrimesAndClues/helpers/navigator/navigator.dart';
import 'package:CrimesAndClues/suspects/model/suspect%20_hive.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';
import 'package:CrimesAndClues/suspects/service/suspects_service.dart';
import 'package:CrimesAndClues/suspects/view/widgets/detail.dart';
import 'package:CrimesAndClues/suspects/viewmodel/cubit.dart';
import 'package:CrimesAndClues/suspects/viewmodel/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SuspectsScreen extends StatefulWidget {
  const SuspectsScreen({super.key});

  @override
  State<SuspectsScreen> createState() => _SuspectsScreenState();
}

class _SuspectsScreenState extends State<SuspectsScreen> {
  List<SuspectHiveModel> suspectsList = AppLists.suspectsList;
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

  suspectDetailDialog(index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuspectsDetailWidget(index: index);
      },
    );
  }

  Widget _imageContainer(index) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/suspects/man2.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _detailsRow(index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DeviceInfo.width(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: DeviceInfo.height(1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    index.name!.toUpperCase(),
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
                    index.age!,
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
                    index.relevance!,
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
          ),
          statementField(),
        ],
      ),
    );
  }

  Widget statementField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            "assets/suspects/statement.png",
            color: AppColor.gunmetalGray,
          ),
        ),
        Expanded(
          child: Text(
            "İfadesini Oku",
            style: GoogleFonts.robotoMono(
              fontSize: 10,
              color: AppColor.gunmetalGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget suspectCard(index) {
    return GestureDetector(
      onTap: () => suspectDetailDialog(index),
      child: Container(
        height: DeviceInfo.height(12),
        width: DeviceInfo.width(100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.crimeBlueDark, AppColor.ivoryWhite.withOpacity(0.2), AppColor.crimeBlueLight],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: _imageContainer(index),
            ),
            Expanded(
              flex: 5,
              child: _detailsRow(index),
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
        margin: EdgeInsets.only(top: DeviceInfo.height(2)),
        child: Text(
          "".toUpperCase(),
          style: GoogleFonts.arbutusSlab(
            fontSize: 36,
            color: AppColor.gunmetalGray,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _suspectsGrid(context) {
    return BlocProvider(
      create: (context) => SuspectsCubit(service: SuspectsService(Application.apiBaseUrl)),
      child: Stack(
        children: [
          _title,
          BlocConsumer<SuspectsCubit, SuspectsState>(
            builder: (context, state) {
              if (state is ResponseSuspectsState) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: DeviceInfo.height(6)),
                    child: Container(
                      height: DeviceInfo.height(65),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: List.generate(
                          state.response.length,
                          (index) {
                            return suspectCard(state.response[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (state is ErrorSuspectsState) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Error"),
                    content: Text(state.errorMessage),
                    actions: [
                      TextButton(onPressed: () => AppNavigator.pop(), child: Text("Kapat")),
                    ],
                  ),
                );
              }
              if (state is LoadingSuspectsState) {
                return Center(child: CircularProgressIndicator(color: AppColor.crimeBlueLight));
              }
              if (state is InitSuspectsState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.read<SuspectsCubit>().getAllSuspects();
                });
                return Center(child: CircularProgressIndicator(color: AppColor.crimeBlueLight));
              }
              return Container();
            },
            listener: (context, state) {
              print(state.toString());
              if (state is InitSuspectsState) {}
            },
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
              firstColor: <Color>[
                AppColor.crimeBlueDarkest,
                AppColor.white,
                AppColor.crimeBlueDarkest,
              ],
              secondColor: <Color>[
                AppColor.darkBlue_030042,
                AppColor.crimeBlueLightest,
                AppColor.darkBlue_05032b,
              ],
              topSecondColor: <Color>[
                AppColor.darkBlue_030042,
                AppColor.crimeBlueLightest,
                AppColor.darkBlue_05032b,
              ],
              thirdColor: <Color>[
                AppColor.crimeBlueNormal,
                AppColor.white,
                AppColor.crimeBlueNormal,
              ],
            ),
          ),
          _isAnimFinished ? _suspectsGrid(context) : Container(),
        ],
      ),
    );
  }
}
