import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Project.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/ReturnObject.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Selecttitle.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Student.dart';
import 'package:futurewrold/view/teacher/project/application/passApplication/PassApplicationPage.dart';

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
    Icon nextIcon = Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 24,);
    if (project.isselect == 1) {
      nextIcon = Icon(Icons.clear, color: Colors.black, size: 2,);
    } else {
      nextIcon = Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 24,);
    }
    if (selectTitle.pass == 0) {
      passIcon = Icon(Icons.help, color: Colors.yellow, size: 32,);
      tempSubtitle = "未处理";
    } else if (selectTitle.pass == 1) {
      passIcon = Icon(Icons.check_circle, color: Colors.green, size: 32,);
      tempSubtitle = "通过，处理时间:" + selectTitle.passdata;
      nextIcon = Icon(Icons.clear, color: Colors.black, size: 2,);
    } else {
      passIcon = Icon(Icons.block, color: Colors.red, size: 32,);
      tempSubtitle = "不通过，处理时间:" + selectTitle.passdata;
      nextIcon = Icon(Icons.clear, color: Colors.black, size: 2,);
    }
    page = ListTile(
      leading: new CircleAvatar(
        backgroundColor: Colors.white,
        child: passIcon,
      ),
      title: new Text(student.name + " - " + student.studentid, style: TextStyle(fontSize: 24),),
      subtitle: new Text(tempSubtitle),
      trailing: nextIcon,
      onTap: () {
        if (project.isselect == 1) {
          print('选择，无反应');
        } else {
          if (selectTitle.pass == 0) {
            print('可以操作');
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => PassApplicaationPage(student, selectTitle)
                )
            );
          } else {
            print('不可以操作');
          }
        }
      },
    );
    setState(() {
      page;
    });
  }
}
