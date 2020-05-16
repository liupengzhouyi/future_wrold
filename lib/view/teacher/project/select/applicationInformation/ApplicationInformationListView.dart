

import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/ReturnObject.dart';
import 'package:futurewrold/view/teacher/project/select/applicationInformation/ApplicationInformationCard.dart';

class ApplicationInformationListView extends StatefulWidget {

  List<ReturnObject> list;


  ApplicationInformationListView(this.list);

  @override
  _ApplicationInformationListViewState createState() => _ApplicationInformationListViewState(this.list);
}

class _ApplicationInformationListViewState extends State<ApplicationInformationListView> {


  List<ReturnObject> list;


  _ApplicationInformationListViewState(this.list);


  Widget page;


  @override
  void initState() {
    page = new Center(child: Icon(Icons.check_circle_outline, color: Colors.orange, size: 64,),);
    createList();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  createList() {
    List<Widget> applicationInformationCardList = new List<Widget>();
    for(ReturnObject item in list) {
      ApplicationInformationCard temp = new ApplicationInformationCard(item);
      applicationInformationCardList.add(temp);
    }
    page = ListView(
      children: applicationInformationCardList,
    );
    setState(() {
      page;
    });
  }
}
