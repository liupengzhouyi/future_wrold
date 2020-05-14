import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/applicationInformation/Project.dart';
import 'package:futurewrold/model/student/project/applicationInformation/ReturnObject.dart';
import 'package:futurewrold/model/student/project/applicationInformation/Selecttitle.dart';
import 'package:futurewrold/model/student/project/applicationInformation/Student.dart';

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
    createCard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  /*{
  "selecttitle": {
  "id": 2,
  "studentid": 1,
  "titleid": 23,
  "applicationdata": "2020-04-12 14:41",
  "passdata": "",
  "pass": 0
  },
  "student": {
  "id": 1,
  "studentid": "1236798",
  "password": 120,
  "imageurl": "",
  "prodessionalid": 123679,
  "phonenumber": "12345678765",
  "isdelete": 0,
  "name": null
  },
  "project": {
  "id": 23,
  "teacherid": 67159002,
  "title": "教师上传毕业设计选题",
  "fileurl": "http://127.0.0.1:8080/File/downloadFile/我遇到了问题希望得到解决.pdf",
  "isselect": 0,
  "studentnumber": ""
  }
  },*/

  createCard() {
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
