import 'dart:convert';
import 'dart:io';

import 'package:animatedloginbutton/animatedloginbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:futurewrold/model/student/landing/ReturnObject.dart';
import 'package:futurewrold/model/student/landing/ReturnStudentLanding.dart';
import 'package:futurewrold/model/student/landing/StudentEntity.dart';
import 'package:futurewrold/model/student/landing/StudentEntityLanding.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:futurewrold/utils/page/TempPage.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/student/registered/studentRegistered.dart';
import 'package:path_provider/path_provider.dart';

class StudentLoginPage extends StatefulWidget {
  @override
  _StudentLoginPageState createState() {
    // TODO: implement createState
    return new _StudentLoginPageState();
  }
}

class _StudentLoginPageState extends State<StudentLoginPage> {

  Widget page;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("学生登录", style: new TextStyle(color: Colors.white)),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body:page,
    );
  }

  @override
  void initState() {
    initPage();
  }

  void initPage() {
    page = Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/image02.png'),
              ),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left:30.0,right: 30.0),
              child: new Container(
                child: buildForm(),
              ),
            ),

          ],
        ),
      ],
    );
  }

  TextEditingController unameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  GlobalKey formKey = new GlobalKey<FormState>();
  final LoginErrorMessageController loginErrorMessageController = LoginErrorMessageController();

  Widget buildForm() {
    return Form(
      //设置globalKey，用于后面获取FormState
      key: formKey,
      //开启自动校验
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
              autofocus: false,
              // keyboardType: TextInputType.number,
              //键盘回车键的样式
              textInputAction: TextInputAction.next,
              controller: unameController,
              decoration: InputDecoration(
                  labelText: "学号编号",
                  hintText: "学号编号",
                  icon: Icon(Icons.person)),
              // 校验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : "学号不能为空";
              }),
          TextFormField(
              autofocus: false,
              controller: pwdController,
              decoration: InputDecoration(
                  labelText: "密码", hintText: "您的登录密码", icon: Icon(Icons.lock)),
              obscureText: true,
              //校验密码
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能少于6位";
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: new Container(
              child:new AnimatedLoginButton(
                loginErrorMessageController:loginErrorMessageController,
                onTap: () async {
                  String userNumber = unameController.text;
                  String password = pwdController.text;
                  StudentLanding studentLandingParameter = new StudentLanding();
                  studentLandingParameter.password = password;
                  Student studentParameter = new Student();
                  studentParameter.studentid = userNumber.toString();
                  studentLandingParameter.student = studentParameter;
                  studentLandingVerification('/student/landing', studentLandingParameter);

                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    '点击注册',
                    style: TextStyle(color: Colors.green),
                  ),
                  onTap: () {
                    _toRegisterPage(context);

                  },
                ),
                GestureDetector(
                  child: Text(
                    '点击注册',
                    style: TextStyle(color: Colors.green),
                  ),
                  onTap: () {
                    _toRegisterPage(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  studentLandingVerification(String url, StudentLanding parameter) async {
    var result = await HttpUtils.request(
      url,
      method: HttpUtils.POST,
      data: parameter.toJson(),
    );
    ReturnStudentLanding returnStudentLanding = ReturnStudentLanding.fromJson(result);
    if (returnStudentLanding.returnKey == true) {
      print("登陆成功");

      ReturnObject returnObject = returnStudentLanding.returnObject;
      Student student = Student.fromJson(returnObject.toJson());

      UserInformation userInformation = new UserInformation();
      userInformation.userType = 3;
      userInformation.landing = 1;
      userInformation.professionalId = student.prodessionalid;
      userInformation.userName = student.name;
      userInformation.userNumber = student.studentid;
      userInformation.password = parameter.password.toString();
      userInformation.imageurl = student.imageurl;
      print(userInformation.toJson().toString());
      //清空原有数据
      clearContent();
      // 保存新的登陆信息
      saveValue(userInformation);
      // 测试读数据
      //_readCounter();
      // 页面跳转
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TempPage(title: '学生登陆成功',),
          )
      );
    } else {
      // print("登陆失败");
      landingErrorTips('错误', returnStudentLanding.why);
    }
  }

  _toRegisterPage(BuildContext context) async{


    final preEmail = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => StudentRegisteredPage()));
  }

  _toRegisterPage2(BuildContext context) async{


    final preEmail = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => TempPage(title: '学生-找回密码',)));
  }


  landingErrorTips(String title, String why) {
    setState(() {
      page = Center(
        child: AlertDialog(
          title: Text(title), //对话框标题
          content: SingleChildScrollView(
            //对话框内容部分
            child: ListBody(
              children: <Widget>[
                Text(why),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                setState(() {
                  initPage();
                });
              },
            ),
          ],
        ),
      );
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

  // 清空本地保存的文件
  void clearContent() async {
    File f = await _getLocalFile();
    await f.writeAsString('');
  }


  /*
   * _readCounter函数，读取点击数
   * 关键字async表示异步操作
   * 返回值Future类型，表示延迟处理的对象
   */
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
      print("=====---- :");
      print(contents);
      print("=====---- :");
      var jsonMap = await json.decode(contents);
      UserInformation userInformation = UserInformation.fromJson(jsonMap);
      print("=====---- :" + userInformation.toString());
    } on FileSystemException {
    }
  }
}

