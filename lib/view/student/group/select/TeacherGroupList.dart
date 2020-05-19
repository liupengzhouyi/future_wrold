import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/group/select/ReturnObject.dart';
import 'package:futurewrold/view/student/group/select/TeacherGroupCard.dart';


class TeacherGroupList extends StatefulWidget {

  String myNumber;

  TeacherGroupList(this.list, this.myNumber);

  List<ReturnObject> list;

  @override
  _TeacherGroupListState createState() => _TeacherGroupListState(this.list, this.myNumber);
}

class _TeacherGroupListState extends State<TeacherGroupList> {

  _TeacherGroupListState(this.list, this.myNumber);

  String myNumber;

  List<ReturnObject> list;

  Widget page;

  @override
  Widget build(BuildContext context) {
    createLIstView();
    return Container(
      child: page,
    );
  }


  void createLIstView() {
    List<Widget> widgetList = new List<Widget>();
    for(ReturnObject item in list) {
      TeacherGroupCard teacherGroupCard = new TeacherGroupCard(item, myNumber);
      widgetList.add(teacherGroupCard);
    }
    page = ListView(
      children: widgetList,
    );
    setState(() {
      page;
    });
  }
}
