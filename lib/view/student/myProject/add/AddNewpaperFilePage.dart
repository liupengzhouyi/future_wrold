

import 'package:flutter/material.dart';

class AddNewpaperFilePage extends StatefulWidget {

  AddNewpaperFilePage(this.titleId, this.studentNumber);

  String titleId;

  String studentNumber;

  @override
  _AddNewpaperFilePageState createState() => _AddNewpaperFilePageState(this.titleId, this.studentNumber);
}

class _AddNewpaperFilePageState extends State<AddNewpaperFilePage> {

  _AddNewpaperFilePageState(this.titleId, this.studentNumber);

  String titleId;

  String studentNumber;

  Widget page;

  @override
  void initState() {
    page = new Center(child: Icon(Icons.block, color: Colors.red, size: 64,),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("添加毕设记录"),
      ),
      body: page,
    );
  }


}
