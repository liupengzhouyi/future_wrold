import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/teacher/select/GetTeacherByProfessionalPage/ReturnObject.dart';
import 'package:futurewrold/view/student/teacher/select/professional/model/TeacherCrad.dart';

class TeacherListView extends StatefulWidget {


  List<ReturnObject> list;

  @override
  _TeacherListViewState createState() => _TeacherListViewState(this.list);

  TeacherListView(this.list);
}

class _TeacherListViewState extends State<TeacherListView> {

  _TeacherListViewState(this.list);

  List<ReturnObject> list;

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

  Widget createListView() {
    List<Widget> teacherCardList = new List();
    for(ReturnObject item in list) {
      TeacherCard teacherCard = new TeacherCard(item);
      teacherCardList.add(teacherCard);
    }
    page = new ListView(
      children: teacherCardList,
    );
    setState(() {
      page;
    });
  }

}
