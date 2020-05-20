import 'package:flutter/material.dart';

class StudentRePassword extends StatefulWidget {

  StudentRePassword(this.studentNumber);

  String studentNumber;

  @override
  _StudentRePasswordState createState() => _StudentRePasswordState(this.studentNumber);
}

class _StudentRePasswordState extends State<StudentRePassword> {

  _StudentRePasswordState(this.studentNumber);

  String studentNumber;

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
