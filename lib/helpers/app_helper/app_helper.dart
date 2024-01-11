import 'package:CrimesAndClues/helpers/app_helper/hive.dart';
import 'package:flutter/material.dart';

class AppHelper {
  static initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppHive.initialize();
  }
}
