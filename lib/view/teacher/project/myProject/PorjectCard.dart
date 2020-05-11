
import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/getMyPorject/ReturnObject.dart';

class ProjectCrad extends StatefulWidget {

  ReturnObject returnObject;

  ProjectCrad(this.returnObject);

  @override
  _ProjectCradState createState() => _ProjectCradState(this.returnObject);
}

// {"id":20,
// "teacherid":67159002,
// "title":"手电筒发光原理",
// "fileurl":"http://127.0.0.1:8080/File/downloadFile/00用例图.pdf",
// "isselect":0,
// "studentnumber":""}

class _ProjectCradState extends State<ProjectCrad> {

  ReturnObject returnObject;

  _ProjectCradState(this.returnObject);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
