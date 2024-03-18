import 'dart:convert';

import 'package:CrimesAndClues/constants/app.dart';
import 'package:CrimesAndClues/suspects/model/suspect%20_hive.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';
import 'package:CrimesAndClues/suspects/service/ISuspectsService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class SuspectsService extends ISuspectsService {
  SuspectsService(super.baseApiUrl);

  @override
  Future<List<SuspectHiveModel?>> getAllSuspects() async {
    var box = await Hive.openBox('suspectsBox');
    List<dynamic> suspectsFromHiveDynamic = box.get('suspectsList') ?? [];

    if (suspectsFromHiveDynamic.isEmpty) {
      print("SERVİSE İSTEK ATILIYOR");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('cases').doc('bVa5gyA7cCxWaAmaCV3N').collection('suspects').get();

      //Add Error Handling

      List<SuspectHiveModel> suspects = querySnapshot.docs.map((doc) => SuspectHiveModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
      //put in hive
      List<SuspectHiveModel> myData = suspects;
      box.put('suspectsList', myData);
    }

    List<SuspectHiveModel> suspectsFromHive = box.get('suspectsList').cast<SuspectHiveModel>();

    return suspectsFromHive;
  }

  //@override
  //Future<List<SuspectModel?>> getAllSuspects() async {
  // print("istek atıldı");
  //var uri = Uri.parse("${Application.apiBaseUrl}$endpoint");
  //final response = await http.get(uri);
  //  if (response.statusCode == 200) {
  //  final json = jsonDecode(response.body);
//
  //  return json.map((e) => SuspectModel.fromJson(e)).toList().cast<SuspectModel>();
  //} else if (response.statusCode == 401) {
  //  throw "${response.body.toString()}";
  //} else {
  //  throw "Something went wrong code ${response.statusCode}";
  //}
  //}
}
