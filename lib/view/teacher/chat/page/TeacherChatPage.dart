import 'package:flutter/material.dart';

class TeacherChatPage extends StatefulWidget {

  TeacherChatPage(this.groupId, this.groupName, this.myNumber);

  String myNumber;
  String groupId;
  String groupName;

  @override
  _TeacherChatPageState createState() => _TeacherChatPageState(this.groupId, this.groupName, this.myNumber);
}

class _TeacherChatPageState extends State<TeacherChatPage> {

  _TeacherChatPageState(this.groupId, this.groupName, this.myNumber);

  String myNumber;
  String groupId;
  String groupName;

  Widget page;

  @override
  void initState() {
    page = new Center(
      child: Icon(Icons.list, color: Colors.lightBlueAccent, size: 64,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(groupName),),
      body: page,
    );
  }
}
