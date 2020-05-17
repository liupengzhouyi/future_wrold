import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/group/select/ReturnObject.dart';
import 'package:futurewrold/model/teacher/group/select/ReturnTeacherGetGroupInformation.dart';
import 'package:futurewrold/model/teacher/group/select/TeacherGetGroupInformation.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/teacher/group/select/TeacherGroupList.dart';
import 'package:path_provider/path_provider.dart';

class SelectMyGroupPage extends StatefulWidget {
  @override
  _SelectMyGroupPageState createState() => _SelectMyGroupPageState();
}

class _SelectMyGroupPageState extends State<SelectMyGroupPage> {

  UserInformation tempUserInformation;

  Widget page;

  @override
  void initState() {
    page = new Center(
      child: Icon(Icons.list, color: Colors.lightBlueAccent, size: 64,),
    );
    readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(title: Text("我的群组"),),
      body: page,
    );
  }

  Future<void> createPage() async {
    TeacherGetGroupInformation teacherGetGroupInformation = new TeacherGetGroupInformation();
    teacherGetGroupInformation.teacherid = int.parse(tempUserInformation.userNumber);
    var result = await HttpUtils.request(
      '/group/getAllByTeacherId',
      method: HttpUtils.POST,
      data: teacherGetGroupInformation.toJson(),
    );
    ReturnTeacherGetGroupInformation returnTeacherGetGroupInformation = ReturnTeacherGetGroupInformation.fromJson(result);
    if (returnTeacherGetGroupInformation.returnKey == true) {
      List<ReturnObject> list = returnTeacherGetGroupInformation.returnObject;
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
    page = TeacherGroupList(list, tempUserInformation.userNumber);
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





  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

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

  void clearContent() async {
    File f = await _getLocalFile();
    await f.writeAsString('');
  }

  void readCounter() async {
    try {
      File file = await _getLocalFile();
      var dir_bool = await file.exists();
      if (!dir_bool) {
        file.create();
        UserInformation userInformation = new UserInformation();
        userInformation.landing = 0;
        saveValue(userInformation);
        // this.initState();
      }
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      UserInformation userInformation = UserInformation.fromJson(jsonMap);
      tempUserInformation = userInformation;
      setState(() {
        tempUserInformation;
      });
      createPage();
    } on FileSystemException {
    }
  }
}
