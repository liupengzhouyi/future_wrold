import 'package:flutter/material.dart';

class SelectTeacherPaper extends StatefulWidget {

  SelectTeacherPaper(this.teachernumber);

  String teachernumber;

  @override
  _SelectTeacherPaperState createState() => _SelectTeacherPaperState(this.teachernumber);


}

class _SelectTeacherPaperState extends State<SelectTeacherPaper> {

  _SelectTeacherPaperState(this.teachernumber);

  String teachernumber;

  Widget page;

  @override
  void initState() {
    page = Center(child: Icon(Icons.find_replace, color: Colors.lightGreenAccent, size: 64,),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("题目列表"),),
      body: Container(
        child: page,
      ),
    );
  }


}
