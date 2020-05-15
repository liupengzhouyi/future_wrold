
import 'package:flutter/material.dart';

class PaperHistoryFilePage extends StatefulWidget {

  PaperHistoryFilePage(this.id, this.name);

  String id;

  String name;

  @override
  _PaperHistoryFilePageState createState() => _PaperHistoryFilePageState(this.id, this.name);
}

class _PaperHistoryFilePageState extends State<PaperHistoryFilePage> {

  _PaperHistoryFilePageState(this.id, this.name);

  String id;

  String name;

  Widget page;


  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.block,
        color: Colors.red,
        size: 64,
      ),
    );
    createPaerFileHostoryListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(name + "历史记录"),
      ),
      body: page,
    );
  }


  

  void createPaerFileHostoryListView() {


    setState(() {
      page;
    });
  }
}
