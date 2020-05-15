import 'package:flutter/material.dart';

class SelectMyPaperFile extends StatefulWidget {

  String titleid;


  SelectMyPaperFile(this.titleid);

  @override
  _SelectMyPaperFileState createState() => _SelectMyPaperFileState(this.titleid);
}

class _SelectMyPaperFileState extends State<SelectMyPaperFile> {


  String titleid;

  Widget page;

  @override
  void initState() {
    page = Icon(Icons.assignment);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("我的毕设记录"),
      ),
      body: page,
    );
  }

  _SelectMyPaperFileState(this.titleid);
}



































