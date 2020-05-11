import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:path_provider/path_provider.dart';



class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  Widget page = new Center(child: new Icon(Icons.rss_feed, size: 123, color: Colors.lightGreenAccent,));
  UserInformation userInformation;


  @override
  void initState() {
    readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
      /*child: Container(
          width:72.0,
          height:72.0,
          decoration:BoxDecoration(
              shape:BoxShape.circle,
              image:DecorationImage(
                image: NetworkImage('http://123.56.167.84:8080/File/downloadFile/userHeadImage.png'),
              )
          )
      ),*/
    );
  }

  void creaetPage() {
    String imageURL = userInformation.imageurl;
    print('imageURL:' + imageURL);
    page = new Column(
      children: <Widget>[
        // Image.network(userInformation.imageurl),
        Container(
            width:72.0,
            height:72.0,
            decoration:BoxDecoration(
                shape:BoxShape.circle,
                image:DecorationImage(
                  // image: NetworkImage('http://123.56.167.84:8080/File/downloadFile/userHeadImage.png'),
                  image: NetworkImage(imageURL),
                )
            )
        ),
        Text('Deliver features faster'),
        Text('Craft beautiful UIs'),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: const FlutterLogo(),
          ),
        ),
        Text('Deliver features faster'),
      ],
    );
    setState(() {
      page = page;
    });
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
        print(userInformation.toString());
        creaetPage();
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

}