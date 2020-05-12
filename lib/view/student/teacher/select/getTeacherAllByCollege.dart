
import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/teacher/select/GetTeacherAllByCollegePage/ReturnObject.dart';
import 'package:futurewrold/model/student/teacher/select/GetTeacherAllByCollegePage/GetTeacherByCollege.dart';
import 'package:futurewrold/model/student/teacher/select/GetTeacherAllByCollegePage/ReturnGetTeacherByCollege.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';


class GetTeacherAllByCollegePage extends StatefulWidget {

  String professionalid;


  GetTeacherAllByCollegePage(this.professionalid);

  @override
  _GetTeacherAllByCollegePageState createState() => _GetTeacherAllByCollegePageState(this.professionalid);
}

class _GetTeacherAllByCollegePageState extends State<GetTeacherAllByCollegePage> {

  _GetTeacherAllByCollegePageState(this.professionalid);

  String professionalid;

  Widget page;

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("学院教师"),
      ),
      body: Form(
        child: Text('学院教师页面'),
      ),
    );
  }

  getData() async {
    GetTeacherByCollege getTeacherByCollege = new GetTeacherByCollege();
    getTeacherByCollege.number = this.professionalid.toString();
    var result = await HttpUtils.request(
      '/teacher/getAllByCollege',
      method: HttpUtils.POST,
      data: getTeacherByCollege.toJson(),
    );
    print(result);
    ReturnGetTeacherByCollege returnGetTeacherByCollege = ReturnGetTeacherByCollege.fromJson(result);
    if (returnGetTeacherByCollege.returnKey == true) {
      List<ReturnObject> list = returnGetTeacherByCollege.returnObject;

    } else {
      setState(() {
        page;
        print('no data');
      });
    }
  }

}
