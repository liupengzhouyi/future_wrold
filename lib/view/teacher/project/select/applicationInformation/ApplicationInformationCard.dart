import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Project.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/ReturnObject.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Selecttitle.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Student.dart';

class ApplicationInformationCard extends StatefulWidget {

  ReturnObject returnObject;


  ApplicationInformationCard(this.returnObject);

  @override
  _ApplicationInformationCardState createState() => _ApplicationInformationCardState(this.returnObject);
}

class _ApplicationInformationCardState extends State<ApplicationInformationCard> {

  ReturnObject returnObject;

  _ApplicationInformationCardState(this.returnObject);

  Widget page;

  @override
  void initState() {
    page = ListTile(
      leading: new CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.list),
      ),
    );
    createPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  void createPage() {
    Student student = Student.fromJson(returnObject.student.toJson());
    Selecttitle selectTitle = Selecttitle.fromJson(returnObject.selecttitle.toJson());
    Project project = Project.fromJson(returnObject.project.toJson());
    Icon passIcon;
    String tempSubtitle;
    if (selectTitle.pass == 0) {
      passIcon = Icon(Icons.help, color: Colors.yellow, size: 32,);
      tempSubtitle = "未处理";
    } else if (selectTitle.pass == 1) {
      passIcon = Icon(Icons.check_circle, color: Colors.green, size: 32,);
      tempSubtitle = "通过，处理时间:" + selectTitle.passdata;
    } else {
      passIcon = Icon(Icons.block, color: Colors.red, size: 32,);
      tempSubtitle = "不通过，处理时间:" + selectTitle.passdata;
    }
    page = ListTile(
      leading: new CircleAvatar(
        backgroundColor: Colors.white,
        child: passIcon,
      ),
      title: new Text(student.name + " - " + student.studentid, style: TextStyle(fontSize: 24),),
      subtitle: new Text(tempSubtitle),
    );
    setState(() {
      page;
    });
  }
}
