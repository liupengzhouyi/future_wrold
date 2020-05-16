import 'package:flutter/material.dart';

class ApplicationInformation extends StatefulWidget {

  ApplicationInformation(this.titleId);

  String titleId;




  @override
  _ApplicationInformationState createState() => _ApplicationInformationState(this.titleId);
}

class _ApplicationInformationState extends State<ApplicationInformation> {


  _ApplicationInformationState(this.titleId);

  String titleId;

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
        title: Text("毕设申请记录"),
      ),
      body: page,
    );
  }
}
