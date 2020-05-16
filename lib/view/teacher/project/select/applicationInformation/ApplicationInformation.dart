
import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/ReturnObject.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/ReturnTeacherGetApplicationInformation.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/TeacherGetApplicationInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/teacher/project/select/applicationInformation/ApplicationInformationListView.dart';

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
      '/OtherContrller/selectApplicationTitleInformationByTitle',
      method: HttpUtils.POST,
      data: teacherGetApplicationInformation.toJson(),
    );
    ReturnTeacherGetApplicationInformation returnTeacherGetApplicationInformation = ReturnTeacherGetApplicationInformation.fromJson(result);
    if (returnTeacherGetApplicationInformation.returnKey == true) {
      List<ReturnObject> list = returnTeacherGetApplicationInformation.returnObject;
      if (list.length == 0) {
        createErrorPage();
      } else {
        createSuccessPage(list);
      }
    } else {
      createErrorPage();
    }
  }

  void createSuccessPage(List<ReturnObject> list) {
    page = ApplicationInformationListView(list);
    setState(() {
      page;
    });
  }

  void createErrorPage() {
    page = new Center(
      child: new Icon(
        Icons.delete_forever,
        color: Colors.lightBlueAccent,
        size: 64,
      ),
    );
    setState(() {
      page;
    });
  }

}
