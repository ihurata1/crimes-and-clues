import 'package:CrimesAndClues/suspects/model/suspect%20_hive.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';

abstract class SuspectsState {}

class InitSuspectsState extends SuspectsState {}

class LoadingSuspectsState extends SuspectsState {
  final bool isLoading;
  LoadingSuspectsState(this.isLoading);
}

class ErrorSuspectsState extends SuspectsState {
  final String errorMessage;
  ErrorSuspectsState(this.errorMessage);
}

class ResponseSuspectsState extends SuspectsState {
  final List<SuspectHiveModel> response;
  ResponseSuspectsState(this.response);
}
