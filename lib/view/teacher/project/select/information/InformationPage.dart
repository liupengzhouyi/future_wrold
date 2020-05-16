import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/information/TeacherGetPaperFile.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class InformationPage extends StatefulWidget {

  InformationPage(this.titleId);

  String titleId;

  @override
  _InformationPageState createState() => _InformationPageState(this.titleId);
}

class _InformationPageState extends State<InformationPage> {

  _InformationPageState(this.titleId);

  String titleId;

  Widget page;


  @override
  void initState() {
    page = new Center(child: new Icon(Icons.rss_feed, size: 123, color: Colors.lightGreenAccent,));
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('毕设文件'),),
      body: Container(
        child: new Center(
            child: page
        ),
      ),
    );
  }


  Future<void> getData() async {
    TeacherGetPaperFile teacherGetPaperFile = new TeacherGetPaperFile();
    teacherGetPaperFile.titleid = int.parse(titleId);
    var result = await HttpUtils.request(
      '/projectfile/getAllByTiitleIdTrue',
      method: HttpUtils.POST,
      data: teacherGetPaperFile.toJson(),
    );


  }
}
