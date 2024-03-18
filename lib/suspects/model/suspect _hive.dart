import 'package:hive_flutter/adapters.dart';
part 'suspect _hive.g.dart';

@HiveType(typeId: 0)
class SuspectHiveModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? age;
  @HiveField(2)
  String? jobTitle;
  @HiveField(3)
  String? relevance;
  @HiveField(4)
  String? statement;
  @HiveField(5)
  String? image;
  @HiveField(6)
  bool? isGuilty;

  SuspectHiveModel({this.name, this.age, this.jobTitle, this.relevance, this.statement, this.isGuilty, this.image});

  SuspectHiveModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    jobTitle = json['jobTitle'];
    relevance = json['relevance'];
    statement = json['statement'];
    isGuilty = json['isGuilty'];
    image = json['image'] ?? "";
  }
}
