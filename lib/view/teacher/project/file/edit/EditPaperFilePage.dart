import 'package:flutter/material.dart';

class EditPaperFilePage extends StatefulWidget {

  String paperFileId;


  EditPaperFilePage(this.paperFileId);

  @override
  _EditPaperFilePageState createState() => _EditPaperFilePageState(this.paperFileId);
}

class _EditPaperFilePageState extends State<EditPaperFilePage> {

  String paperFileId;


  _EditPaperFilePageState(this.paperFileId);

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
        title: Text("指导论文文件"),
      ),
      body: page,
    );
  }

}
