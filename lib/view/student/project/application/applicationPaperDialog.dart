import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/application/ApplicationPaper.dart';
import 'package:futurewrold/model/student/project/application/ReturnApplicationPaper.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:path_provider/path_provider.dart';

class ApplicationPaperDialog extends StatefulWidget {

  String paperId;

  String paperTitle;

  ApplicationPaperDialog(this.paperId, this.paperTitle);

  @override
  _ApplicationPaperDialogState createState() => _ApplicationPaperDialogState(this.paperId, this.paperTitle);
}

class _ApplicationPaperDialogState extends State<ApplicationPaperDialog> {

  String paperId;

  String paperTitle;

  UserInformation tempUserInformation;

  _ApplicationPaperDialogState(this.paperId, this.paperTitle);

  Widget page;

  @override
  void initState() {
    page = AlertDialog(
      title: new Text('申请毕业设计'),
      content: new SingleChildScrollView(
        child: new Center(
          child: Icon(Icons.find_replace, color: Colors.lightGreenAccent, size: 64,),
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text('确定'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }


  Future<void> applicationPaperFunction() async {
    ApplicationPaper applicationPaper = new ApplicationPaper();
    applicationPaper.titleid = int.parse(paperId);
    applicationPaper.studentid = int.parse(tempUserInformation.userNumber);
    var result = await HttpUtils.request(
      '/selecttitle/add',
      method: HttpUtils.POST,
      data: applicationPaper.toJson(),
    );
    ReturnApplicationPaper returnApplicationPaper = ReturnApplicationPaper.fromJson(result);
    if (returnApplicationPaper.returnKey == true) {
      applicarionSuccess();
    } else {
      applicarionError(returnApplicationPaper.why);
    }
  }


  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
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

  void readCounter() async {
    try {
      File file = await _getLocalFile();
      var dir_bool = await file.exists();
      if (dir_bool) {
        print('true');
      } else {
        print('false');
        file.create();
        UserInformation userInformation = new UserInformation();
        userInformation.landing = 0;
        saveValue(userInformation);
      }
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      UserInformation userInformation = UserInformation.fromJson(jsonMap);
      tempUserInformation = userInformation;
      setState(() {
        tempUserInformation;
      });
      page = AlertDialog(
        title: new Text('申请毕业设计'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('题目：' + paperTitle),
              new Text('申请人姓名：' + tempUserInformation.userName),
              new Text('申请人编号：' + tempUserInformation.userNumber),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('取消'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text('确定'),
            onPressed: () {
              applicationPaperFunction();
              // Navigator.of(context).pop();
            },
          ),
        ],
      );
      print("=====---- :" + userInformation.toString());
    } on FileSystemException {
    }
    setState(() {
      page;
    });
  }

  applicarionSuccess() {
    page = AlertDialog(
      title: new Text('申请毕业设计'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text('题目：' + paperTitle),
            new Text('申请人姓名：' + tempUserInformation.userName),
            new Text('申请人编号：' + tempUserInformation.userNumber),
            new Center(child: new Text('申请成功', style: TextStyle(color: Colors.green, fontSize: 48),),),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text('确定'),
          onPressed: () {
            applicationPaperFunction();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    setState(() {
      page;
    });
  }

  applicarionError(String why) {
    page = AlertDialog(
      title: new Text('申请毕业设计'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text('题目：' + paperTitle),
            new Text('申请人姓名：' + tempUserInformation.userName),
            new Text('申请人编号：' + tempUserInformation.userNumber),
            new Center(child: new Text('申请失败：' + why, style: TextStyle(color: Colors.red, fontSize: 32),),),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text('确定'),
          onPressed: () {
            applicationPaperFunction();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    setState(() {
      page;
    });
  }
}
