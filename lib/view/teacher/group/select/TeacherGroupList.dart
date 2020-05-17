import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/group/select/ReturnObject.dart';


class TeacherGroupList extends StatefulWidget {

  TeacherGroupList(this.list);

  List<ReturnObject> list;

  @override
  _TeacherGroupListState createState() => _TeacherGroupListState();
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

  }
}
