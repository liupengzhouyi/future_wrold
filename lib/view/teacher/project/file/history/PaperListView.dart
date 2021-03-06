

import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/file/history/ReturnObject.dart';
import 'package:futurewrold/view/teacher/project/file/history/PaperFileCard.dart';

class PaperListView extends StatefulWidget {

  PaperListView(this.list);

  List<ReturnObject> list;

  @override
  _PaperListViewState createState() => _PaperListViewState(this.list);
}

class _PaperListViewState extends State<PaperListView> {

  _PaperListViewState(this.list);

  List<ReturnObject> list;

  Widget page;


  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.find_replace,
        color: Colors.lightGreenAccent,
        size: 64,),
    );
    createPaperListView();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }
  void createPaperListView() {
    List<Widget> widgetList = new List();
    for (ReturnObject item in list) {
      PaperFileCard temp = PaperFileCard(item);
      widgetList.add(temp);
    }
    page = ListView(
      children: widgetList,
    );
    setState(() {
      page;
    });
  }

}
