import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Selecttitle.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Student.dart';


class PassApplicaationPage extends StatefulWidget {

  PassApplicaationPage(this.student, this.selecttitle);

  Student student;

  Selecttitle selecttitle;

  @override
  _PassApplicaationPageState createState() => _PassApplicaationPageState(this.student, this.selecttitle);


}

class _PassApplicaationPageState extends State<PassApplicaationPage> {

  _PassApplicaationPageState(this.student, this.selecttitle);

  Student student;

  Selecttitle selecttitle;

  Widget page;

  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.check_circle,
        color: Colors.lightBlueAccent,
        size: 64,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("批准申请"),
      ),
      body: page,
    );
  }


}
