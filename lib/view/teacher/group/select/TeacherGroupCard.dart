import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/group/select/ReturnObject.dart';

class TeacherGroupCard extends StatefulWidget {

  ReturnObject returnObject;


  TeacherGroupCard(this.returnObject);

  @override
  _TeacherGroupCardState createState() => _TeacherGroupCardState(this.returnObject);
}

class _TeacherGroupCardState extends State<TeacherGroupCard> {

  ReturnObject returnObject;


  _TeacherGroupCardState(this.returnObject);


  Widget page;

  @override
  Widget build(BuildContext context) {
    createCard();
    return Container(
      child: page,
    );
  }

  void createCard() {
    page = ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(returnObject.imageurl),
      ),
      title: new Text(returnObject.name),
      trailing: new Icon(Icons.arrow_forward_ios),
    );
    setState(() {
      page;
    });
  }


}
