import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/getMyPorject/ReturnObject.dart';
import 'package:futurewrold/model/teacher/project/getMyPorject/ReturnTeacherGerOwnProject.dart';
import 'package:futurewrold/model/teacher/project/getMyPorject/TeacherGerOwnProject.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/teacher/project/myProject/PorjectCard.dart';
import 'package:path_provider/path_provider.dart';


void main() => runApp(
    new MaterialApp(
      home: SelectMyProject(),
    ),
);

class SelectMyProject extends StatefulWidget {
  @override
  _SelectMyProjectState createState() => _SelectMyProjectState();
}

class _SelectMyProjectState extends State<SelectMyProject> {

  Widget page = new Center(child: new Icon(Icons.rss_feed, size: 123, color: Colors.lightGreenAccent,));
  UserInformation userInformation;
  String url = '/project/getAllByTeacherId';
  TeacherGerOwnProject teacherGerOwnProject;


  @override
  void initState() {
    readCounter();
    // getMyProject();
  }

  @override
  Widget build(BuildContext context) {
    // getMyProject();
    return Scaffold(
      //appBar: AppBar(title: Text('123'),),
      body: Container(
        child: new Center(
            child: page
        ),
      ),
    );
  }


  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  void readCounter() async {
    try {
      File file = await _getLocalFile();
      var dir_bool = await file.exists();
      if (!dir_bool) {
        file.create();
        userInformation = new UserInformation();
        userInformation.landing = 0;
        saveValue(userInformation);
      }
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      setState(() {
        userInformation = UserInformation.fromJson(jsonMap);
        teacherGerOwnProject = new TeacherGerOwnProject();
        teacherGerOwnProject.teacherid = int.parse(userInformation.userNumber);
        getMyProject();
        page;
      });
    } on FileSystemException {
    }
  }



  // 保存登陆数据
  void saveValue(UserInformation userInformation) async {
    try {
      File f = await _getLocalFile();
      IOSink slink = f.openWrite(mode: FileMode.append);
      slink.write('${userInformation.toString()}');
      slink.close();
    } catch (e) {
      // 写入错误
      print(e);
    }
  }

  void getMyProject() async {
    var result = await HttpUtils.request(
      url,
      method: HttpUtils.POST,
      data: teacherGerOwnProject.toJson(),
    );
    ReturnTeacherGerOwnProject returnTeacherGerOwnProject = ReturnTeacherGerOwnProject.fromJson(result);
    if (returnTeacherGerOwnProject.returnKey == false) {
      print('123456');
      page = new Center(
        child: Column(
          children: <Widget>[
            new Icon(Icons.error, size: 123, color: Colors.red,),
            new Text(returnTeacherGerOwnProject.why),
          ],
        ),
      );
    } else {
      List<ReturnObject> list;
      list = returnTeacherGerOwnProject.returnObject;
      List<Widget> lpList = new List<Widget>();
      for(ReturnObject item in list) {
        lpList.add(new ProjectCard(item));
      }
      page = Container(
        child: new ListView(
          children: lpList,
        ),
      );
    }
    setState(() {
      page = page;
    });
  }
}
