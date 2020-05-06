import 'package:futurewrold/model/teacher/landing/TeacherEntity.dart';

class TeacherLanding {
  String password;
  String password1;
  String password2;
  Teacher teacher;

  TeacherLanding({this.password, this.password1, this.password2, this.teacher});

  TeacherLanding.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    password1 = json['password1'];
    password2 = json['password2'];
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['password1'] = this.password1;
    data['password2'] = this.password2;
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    return data;
  }
}