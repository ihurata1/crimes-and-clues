import 'package:CrimesAndClues/components/app_container/app_container.dart';
import 'package:CrimesAndClues/suspects/model/suspect%20_hive.dart';
import 'package:CrimesAndClues/suspects/model/suspect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TempSuspectScreen extends StatefulWidget {
  const TempSuspectScreen({super.key});

  @override
  State<TempSuspectScreen> createState() => _TempSuspectScreenState();
}

class _TempSuspectScreenState extends State<TempSuspectScreen> {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  List<SuspectHiveModel> suspectList = [];
  QuerySnapshot? querySnapshot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllSuspects();
  }

  Future<void> getAllSuspects() async {
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
    setState(() {
      suspectList = suspectsFromHive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Container(
        child: suspectList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: suspectList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(suspectList[index].name!), // 'suspectName' yerine veritabanındaki gerçek alan adını kullanın
                    subtitle: Text(suspectList[index].relevance!), // 'suspectDetails' yerine veritabanındaki gerçek alan adını kullanın
                  );
                },
              ),
      ),
    );
  }
}
