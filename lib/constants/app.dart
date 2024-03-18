// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static int versionCode = 0; //Updated from env.json file.
  static String versionName = ""; //Updated from env.json file.
  static String name = "boilerplate"; //Updated from env.json file.
  static String apiBaseUrl = "https://65ba2404b4d53c066552249e.mockapi.io/api/CrimesAndClues";

  ///Updated from env.json file.

  static get context => navigatorKey.currentContext;
}
