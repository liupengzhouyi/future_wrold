import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/group/select/ReturnObject.dart';
import 'package:futurewrold/view/student/chat/page/StudentChatPage.dart';

class TeacherGroupCard extends StatefulWidget {

  String myNumber;

  ReturnObject returnObject;


  TeacherGroupCard(this.returnObject, this.myNumber);

  @override
  _TeacherGroupCardState createState() => _TeacherGroupCardState(this.returnObject, this.myNumber);
}

class _TeacherGroupCardState extends State<TeacherGroupCard> {

  ReturnObject returnObject;

  String myNumber;

  _TeacherGroupCardState(this.returnObject, this.myNumber);


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
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StudentChatPage(returnObject.id.toString(), returnObject.name, myNumber)
            )
        );
      },
    );
    setState(() {
      page;
    });
  }


}
