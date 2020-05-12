
import 'package:flutter/material.dart';

class GetTeacherAllByCollegePage extends StatefulWidget {

  String professionalid;


  GetTeacherAllByCollegePage(this.professionalid);

  @override
  _GetTeacherAllByCollegePageState createState() => _GetTeacherAllByCollegePageState(this.professionalid);
}

class _GetTeacherAllByCollegePageState extends State<GetTeacherAllByCollegePage> {
  String professionalid;

  _GetTeacherAllByCollegePageState(this.professionalid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("学院教师"),
      ),
      body: Form(
        child: Text('学院教师页面'),
      ),
    );
  }
}
