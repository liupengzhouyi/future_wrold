import 'package:flutter/material.dart';

class ApplicationInformationPage extends StatefulWidget {

  String paperId;

  String paperTitle;

  ApplicationInformationPage(this.paperId, this.paperTitle);

  @override
  _ApplicationInformationPageState createState() => _ApplicationInformationPageState(this.paperId, this.paperTitle);
}

class _ApplicationInformationPageState extends State<ApplicationInformationPage> {

  String paperId;

  String paperTitle;

  Widget page;

  _ApplicationInformationPageState(this.paperId, this.paperTitle);


  @override
  void initState() {
    page = Center(child: Icon(Icons.add, color: Colors.blue, size: 64,),);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("申请信息"),),
      body: Container(
        child: page,
      ),
    );
  }



}
