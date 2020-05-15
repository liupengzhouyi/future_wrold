import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:path_provider/path_provider.dart';

class AddLink extends StatefulWidget {

  AddLink(this.id);

  String id;

  @override
  _AddLinkState createState() => _AddLinkState(this.id);
}

class _AddLinkState extends State<AddLink> {

  _AddLinkState(this.id);

  String id;

  UserInformation tempUserInformation;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      height: 150,
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: RaisedButton(
          child: const Text('添加新环节', style: TextStyle(fontSize: 20)),
          onPressed: () {

          },
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

  void _readCounter() async {
    try {
      /*
       * 获取本地文件目录
       * 关键字await表示等待操作完成
       */
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
      print("=====---- :" + userInformation.toString());
    } on FileSystemException {
    }
  }

}
