import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/group/select/ReturnObject.dart';
import 'package:futurewrold/view/teacher/group/select/TeacherGroupCard.dart';


class TeacherGroupList extends StatefulWidget {

  TeacherGroupList(this.list);

  List<ReturnObject> list;

  @override
  _TeacherGroupListState createState() => _TeacherGroupListState(this.list);
}

class _TeacherGroupListState extends State<TeacherGroupList> {

  _TeacherGroupListState(this.list);

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
      TeacherGroupCard teacherGroupCard = new TeacherGroupCard(item);
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
