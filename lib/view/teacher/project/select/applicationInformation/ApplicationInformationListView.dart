import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/ReturnObject.dart';

class ApplicationInformationListView extends StatefulWidget {

  List<ReturnObject> list;


  ApplicationInformationListView(this.list);

  @override
  _ApplicationInformationListViewState createState() => _ApplicationInformationListViewState(this.list);
}

class _ApplicationInformationListViewState extends State<ApplicationInformationListView> {


  List<ReturnObject> list;


  _ApplicationInformationListViewState(this.list);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
