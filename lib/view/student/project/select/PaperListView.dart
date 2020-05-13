import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/select/ReturnObject.dart';
import 'package:futurewrold/view/student/project/select/PaperCard.dart';


class PaperListView extends StatefulWidget {

  PaperListView(this.list, this.name);

  List<ReturnObject> list;
  String name;

  @override
  _PaperListViewState createState() => _PaperListViewState(this.list, this.name);


}

class _PaperListViewState extends State<PaperListView> {

  _PaperListViewState(this.list, this.name);

  List<ReturnObject> list;

  String name;

  Widget page;


  @override
  void initState() {
    createListView();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  void createListView() {
    List<Widget> paperList = new List();
    for(ReturnObject item in list) {
      PaperCard temp = new PaperCard(name, item);
      paperList.add(temp);
    }
    page = new ListView(
      children: paperList,
    );
    setState(() {
      page;
    });
  }

}
