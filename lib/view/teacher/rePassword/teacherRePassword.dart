import 'package:flutter/material.dart';

class TeacherRePassword extends StatefulWidget {

  TeacherRePassword(this.teacherNumber);

  String teacherNumber;

  @override
  _TeacherRePasswordState createState() => _TeacherRePasswordState(this.teacherNumber);
}

class _TeacherRePasswordState extends State<TeacherRePassword> {

  _TeacherRePasswordState(this.teacherNumber);

  String teacherNumber;

  Widget page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("修改密码"),),
      body: Container(
        child: page,
      ),
    );
  }
}
