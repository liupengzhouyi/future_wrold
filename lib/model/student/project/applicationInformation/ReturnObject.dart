import 'package:futurewrold/model/student/project/applicationInformation/Project.dart';
import 'package:futurewrold/model/student/project/applicationInformation/Selecttitle.dart';
import 'package:futurewrold/model/student/project/applicationInformation/Student.dart';

class ReturnObject {
  Selecttitle selecttitle;
  Student student;
  Project project;

  ReturnObject({this.selecttitle, this.student, this.project});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    selecttitle = json['selecttitle'] != null
        ? new Selecttitle.fromJson(json['selecttitle'])
        : null;
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.selecttitle != null) {
      data['selecttitle'] = this.selecttitle.toJson();
    }
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project.toJson();
    }
    return data;
  }
}