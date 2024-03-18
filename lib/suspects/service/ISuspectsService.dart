// ignore_for_file: constant_identifier_names

import 'package:CrimesAndClues/suspects/model/suspect%20_hive.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ISuspectsService {
  final String baseApiUrl;

  ISuspectsService(this.baseApiUrl);
  final String endpoint = ISuspectsServicePath.GETALL.value;

  Future<List<SuspectHiveModel?>> getAllSuspects();
}

enum ISuspectsServicePath { GETALL }

extension ISuspectsServicePathExtension on ISuspectsServicePath {
  String get value {
    switch (this) {
      case ISuspectsServicePath.GETALL:
        return "getAllSuspects"; //API ENDPOINT GELECEK.
    }
  }
}
