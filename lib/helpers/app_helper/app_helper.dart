import 'package:CrimesAndClues/helpers/app_helper/hive.dart';
import 'package:CrimesAndClues/suspects/model/suspect%20_hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppHelper {
  static initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppHive.initialize();
    Hive.registerAdapter(SuspectHiveModelAdapter());
    await Firebase.initializeApp();
  }
}
