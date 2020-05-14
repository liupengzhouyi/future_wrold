import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:futurewrold/view/student/myProject/information/MyPaperPage.dart';
import 'package:futurewrold/view/student/teacher/select/college/getTeacherAllByCollege.dart';
import 'package:futurewrold/view/student/teacher/select/professional/getTeacherByProfessional.dart';
import 'package:futurewrold/view/teacher/project/add/addProjectPage.dart';
import 'package:futurewrold/view/teacher/project/myProject/SelectMyProject.dart';
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
    );
  }

  void creaetPage() {
    String imageURL = userInformation.imageurl;
    // print('imageURL:' + imageURL);
    page = new ListView(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Image.network(userInformation.imageurl),
        SizedBox(height: 100,),
        Container(
            width:172.0,
            height:172.0,
            decoration:BoxDecoration(
                shape:BoxShape.circle,
                image:DecorationImage(
                  // image: NetworkImage('http://123.56.167.84:8080/File/downloadFile/userHeadImage.png'),
                  image: NetworkImage(imageURL),
                )
            )
        ),
        SizedBox(height: 5,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text('姓名：', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
            Expanded(
              child: Text(userInformation.userName, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: <Widget>[
            Expanded(
              child: Text('专业编号', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
            Expanded(
              child: Text(userInformation.professionalId.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: <Widget>[
            Expanded(
              child: Text('电话号码', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
            Expanded(
              child: Text(userInformation.phoneNumber, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
        SizedBox(height: 20,),
        RaisedButton(
            color: Colors.blueAccent,
            child: Text("我的题目"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10) //设置圆角
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyPaperPage(userInformation.userNumber),
                  )
              );
            }
        ),
        SizedBox(height: 20,),
        RaisedButton(
          color: Colors.lightGreenAccent,
          child: Text("添加题目"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) //设置圆角
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TeacherAddProjectPage(userInformation.userNumber),
                )
            );
          },
        ),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text("修改密码"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) //设置圆角
          ),
          onPressed: () => print("圆角按钮"),
        ),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text("查看专业教师"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) //设置圆角
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GetTeacherByProfessionalPage(userInformation.professionalId.toString()),
                )
            );
          },
        ),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text("查看学院教师"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) //设置圆角
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GetTeacherAllByCollegePage(userInformation.professionalId.toString()),
                )
            );
          },
        ),
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
