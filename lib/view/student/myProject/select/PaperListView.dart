

import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/select/ReturnObject.dart';

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
  Widget build(BuildContext context) {
    return Container();
  }





}
