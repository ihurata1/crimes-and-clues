import 'package:CrimesAndClues/suspects/model/suspect%20_hive.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';
import 'package:CrimesAndClues/suspects/service/ISuspectsService.dart';
import 'package:CrimesAndClues/suspects/viewmodel/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuspectsCubit extends Cubit<SuspectsState> {
  SuspectsCubit({required this.service}) : super(InitSuspectsState());

  final ISuspectsService service;
  bool isLoading = false;

  Future<void> getAllSuspects() async {
    try {
      emit(LoadingSuspectsState(isLoading));
      changeLoadingView();
      final response = await service.getAllSuspects();
      changeLoadingView();

      if (response is List<SuspectHiveModel>) {
        emit(ResponseSuspectsState(response));
      }
    } catch (e) {
      Future.delayed(Duration(seconds: 1));
      changeLoadingView();
      emit(ErrorSuspectsState(e.toString()));
      print("GİRDİ  " + e.toString());
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoadingSuspectsState(isLoading));
  }
}
