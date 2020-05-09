import 'package:futurewrold/model/student/registered/Student.dart';

class StudentRegistered {
  String password;
  String password1;
  String password2;
  Student student;

  StudentRegistered(
      {this.password, this.password1, this.password2, this.student});

  StudentRegistered.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    password1 = json['password1'];
    password2 = json['password2'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['password1'] = this.password1;
    data['password2'] = this.password2;
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return '{"password": $password, "password1": $password1, "password2": $password2, "student": $student}';
  }


}
