import 'package:flutter/material.dart';

class MyPaperPage extends StatefulWidget {

  String userNumber;


  MyPaperPage(this.userNumber);

  @override
  _MyPaperPageState createState() => _MyPaperPageState(this.userNumber);
}

class _MyPaperPageState extends State<MyPaperPage> {

  String userNumber;

  _MyPaperPageState(this.userNumber);

  Widget page;


  @override
  void initState() {
    page = Center(
      child: Icon(
        Icons.assignment,
        color: Colors.blue,
        size: 64,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("我的毕设"),
      ),
      body: Form(
        child: page,
      ),
    );
  }
}
