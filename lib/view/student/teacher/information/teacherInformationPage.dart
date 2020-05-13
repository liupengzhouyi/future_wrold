import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/teacher/information/SelectTeacherByNumber.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class TeacherInformationPage extends StatefulWidget {

  String teachernumber;


  TeacherInformationPage(this.teachernumber);

  @override
  _TeacherInformationPageState createState() => _TeacherInformationPageState(this.teachernumber);
}

class _TeacherInformationPageState extends State<TeacherInformationPage> {

  _TeacherInformationPageState(this.teachernumber);

  String teachernumber;

  SelectTeacherByNumber selectTeacherByNumber = new SelectTeacherByNumber();


  @override
  void initState() {
    selectTeacherByNumber.teachernumber = this.teachernumber;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.access_alarms, color: Colors.lightGreen, size: 28,),
    );
  }

  Future<void> getData() async {
    var result = await HttpUtils.request(
        '/teacher/selectByNumber',
        method: HttpUtils.POST,
        data: selectTeacherByNumber.toJson(),
    );
    print(result);


  }



}
