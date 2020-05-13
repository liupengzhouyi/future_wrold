

import 'package:flutter/material.dart';

import 'package:futurewrold/model/student/teacher/select/GetTeacherAllByCollegePage/ReturnObject.dart';
import 'package:futurewrold/view/student/teacher/information/teacherInformationPage.dart';

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
            backgroundImage: NetworkImage(returnObject.imageurl),
        ),
        title: new Text(returnObject.name),
        subtitle: new Text(returnObject.professionalid),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TeacherInformationPage(returnObject.teachernumber),
            )
          );
        },
      ),
    );
  }


}
