import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/applicationInformation/ReturnObject.dart';
import 'package:futurewrold/view/student/project/applicationInformation/ApplicationInformationCard.dart';

class ApplicationInformationList extends StatefulWidget {

  List<ReturnObject> list;


  ApplicationInformationList(this.list);

  @override
  _ApplicationInformationListState createState() => _ApplicationInformationListState(this.list);
}

class _ApplicationInformationListState extends State<ApplicationInformationList> {

  List<ReturnObject> list;


  _ApplicationInformationListState(this.list);

  Widget page;


  @override
  void initState() {
    page = Center(
      child: Icon(Icons.autorenew, color: Colors.deepOrange, size: 64,),
    );
    createList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  void createList() {
    List<Widget> tempList = new List();
    for (ReturnObject item in list) {
      ApplicationInformationCard applicationInformationCard = new ApplicationInformationCard(item);
      tempList.add(applicationInformationCard);
    }
    page = ListView(
      children: tempList,
    );
    setState(() {
      page;
    });
  }

}
