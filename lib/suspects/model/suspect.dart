class SuspectModel {
  String? name;
  String? age;
  String? jobTitle;
  String? relavence;
  String? statement;
  String? image;
  bool? isGuilty;

  SuspectModel({this.name, this.age, this.jobTitle, this.relavence, this.statement, this.isGuilty, this.image});

  SuspectModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    jobTitle = json['jobTitle'];
    relavence = json['relavence'];
    statement = json['statement'];
    isGuilty = json['isGuilty'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['jobTitle'] = this.jobTitle;
    data['relavence'] = this.relavence;
    data['statement'] = this.statement;
    data['isGuilty'] = this.isGuilty;
    data['image'] = this.image;
    return data;
  }
}
