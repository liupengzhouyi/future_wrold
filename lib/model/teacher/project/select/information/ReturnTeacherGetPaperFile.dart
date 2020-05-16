import 'package:futurewrold/model/teacher/project/select/information/ReturnObject.dart';

class ReturnTeacherGetPaperFile {
  String what;
  bool returnKey;
  List<ReturnObject> returnObject;
  String why;

  ReturnTeacherGetPaperFile(
      {this.what, this.returnKey, this.returnObject, this.why});

  ReturnTeacherGetPaperFile.fromJson(Map<String, dynamic> json) {
    what = json['what'];
    returnKey = json['returnKey'];
    if (json['returnObject'] != null) {
      returnObject = new List<ReturnObject>();
      json['returnObject'].forEach((v) {
        returnObject.add(new ReturnObject.fromJson(v));
      });
    }
    why = json['why'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['what'] = this.what;
    data['returnKey'] = this.returnKey;
    if (this.returnObject != null) {
      data['returnObject'] = this.returnObject.map((v) => v.toJson()).toList();
    }
    data['why'] = this.why;
    return data;
  }
}