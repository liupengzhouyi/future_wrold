import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/information/ReturnTeacherGetPaperFile.dart';
import 'package:futurewrold/model/teacher/project/select/information/ReturnObject.dart';
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
    ReturnTeacherGetPaperFile returnTeacherGetPaperFile = ReturnTeacherGetPaperFile.fromJson(result);
    if (returnTeacherGetPaperFile.returnKey == true) {
      List<ReturnObject> list = returnTeacherGetPaperFile.returnObject;
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


    setState(() {
      page;
    });
  }


  void createErrorPage() {
    page = new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.delete_forever,
              size: 128,
              color: Colors.blue,
            ),
            new Text('没有数据'),
          ],
        )
    );
    setState(() {
      page;
    });
  }
}
