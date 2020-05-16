import 'package:flutter/material.dart';

class UpdatePaperFilePage extends StatefulWidget {

  UpdatePaperFilePage(this.titleId, this.studentNumber, this.name);

  String titleId;

  String studentNumber;

  String name;

  @override
  _UpdatePaperFilePageState createState() => _UpdatePaperFilePageState(this.titleId, this.studentNumber, this.name);
}

class _UpdatePaperFilePageState extends State<UpdatePaperFilePage> {

  _UpdatePaperFilePageState(this.titleId, this.studentNumber, this.name);

  String titleId;

  String studentNumber;

  String name;

  String introduction;

  String fileUrl;

  Widget page;


  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.chat,
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
          title: Text("更新毕设记录"),
        ),
        body:page,
    );
  }


}
