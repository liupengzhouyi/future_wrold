

import 'package:flutter/material.dart';

import 'package:futurewrold/model/student/teacher/select/GetTeacherByProfessionalPage/ReturnObject.dart';

class TeacherCard extends StatefulWidget {

  TeacherCard(this.returnObject);

  ReturnObject returnObject;

  @override
  _TeacherCardState createState() => _TeacherCardState(this.returnObject);


}

class _TeacherCardState extends State<TeacherCard> {

  _TeacherCardState(this.returnObject);

  ReturnObject returnObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListTile(
        leading: new CircleAvatar(
            backgroundColor: Color(0xffff0000),
            radius: 50.0,
            child: new Image.network(returnObject.imageurl)
        ),
        title: new Text(returnObject.name),
        subtitle: new Text(returnObject.professionalid),
        onTap: () => {},
      ),
    );
  }


}
