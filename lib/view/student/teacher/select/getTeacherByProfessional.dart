import 'package:flutter/material.dart';

class GetTeacherByProfessionalPage extends StatefulWidget {


  String professionalid;


  @override
  _GetTeacherByProfessionalPageState createState() => _GetTeacherByProfessionalPageState(this.professionalid);

  GetTeacherByProfessionalPage(this.professionalid);
}

class _GetTeacherByProfessionalPageState extends State<GetTeacherByProfessionalPage> {

  String professionalid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("专业教师"),
      ),
      body: Form(
        child: Text('专业教师页面'),
      ),
    );
  }
  _GetTeacherByProfessionalPageState(this.professionalid);


}
