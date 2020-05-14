import 'package:futurewrold/model/student/myProject/information/Project.dart';
import 'package:futurewrold/model/student/myProject/information/Selecttitle.dart';
import 'package:futurewrold/model/student/myProject/information/Student.dart';
import 'package:futurewrold/model/student/myProject/information/Teacher.dart';

class ReturnObject {
  Student student;
  Teacher teacher;
  Selecttitle selecttitle;
  Project project;

  ReturnObject({this.student, this.teacher, this.selecttitle, this.project});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    selecttitle = json['selecttitle'] != null
        ? new Selecttitle.fromJson(json['selecttitle'])
        : null;
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    if (this.selecttitle != null) {
      data['selecttitle'] = this.selecttitle.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project.toJson();
    }
    return data;
  }
}
