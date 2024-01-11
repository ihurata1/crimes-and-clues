// ignore_for_file: must_be_immutable

import 'package:CrimesAndClues/constants/app.dart';
import 'package:CrimesAndClues/constants/colors.dart';
import 'package:CrimesAndClues/helpers/app_helper/app_helper.dart';
import 'package:CrimesAndClues/helpers/app_helper/app_preferences.dart';
import 'package:CrimesAndClues/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await AppHelper.initialize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: Application.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.bloodRed),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
