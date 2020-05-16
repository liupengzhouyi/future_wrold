import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/file/select/ReturnObject.dart';
import 'package:futurewrold/view/teacher/project/file/select/PaperFileCard.dart';


class PaperFileListView extends StatefulWidget {

  PaperFileListView(this.list);

  List<ReturnObject> list;

  @override
  _PaperFileListViewState createState() => _PaperFileListViewState(this.list);
}

class _PaperFileListViewState extends State<PaperFileListView> {

  _PaperFileListViewState(this.list);

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
    ReturnObject t = list[0];
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
