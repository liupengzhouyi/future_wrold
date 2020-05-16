import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/TeacherGetApplicationInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class ApplicationInformation extends StatefulWidget {

  ApplicationInformation(this.titleId);

  String titleId;




  @override
  _ApplicationInformationState createState() => _ApplicationInformationState(this.titleId);
}

class _ApplicationInformationState extends State<ApplicationInformation> {


  _ApplicationInformationState(this.titleId);

  String titleId;

  Widget page;


  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.check_circle,
        color: Colors.lightBlueAccent,
        size: 64,
      ),
    );
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("毕设申请记录"),
      ),
      body: page,
    );
  }

  Future<void> getData() async {
    TeacherGetApplicationInformation teacherGetApplicationInformation = new TeacherGetApplicationInformation();
    teacherGetApplicationInformation.titleid = int.parse(titleId);
    var result = await HttpUtils.request(
      '/selecttitle/getAllByTitle',
      method: HttpUtils.POST,
      data: teacherGetApplicationInformation.toJson(),
    );



  }
}
