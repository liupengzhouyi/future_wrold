import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {

  InformationPage(this.titleId);

  String titleId;

  @override
  _InformationPageState createState() => _InformationPageState(this.titleId);
}

class _InformationPageState extends State<InformationPage> {

  _InformationPageState(this.titleId);

  String titleId;

  Widget page;


  @override
  void initState() {
    page = new Center(child: new Icon(Icons.rss_feed, size: 123, color: Colors.lightGreenAccent,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('毕设文件'),),
      body: Container(
        child: new Center(
            child: page
        ),
      ),
    );
  }
}
