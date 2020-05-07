import 'dart:convert';
import 'dart:io';

import 'package:animatedloginbutton/animatedloginbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:futurewrold/model/teacher/landing/ReturnTeacherLanding.dart';
import 'package:futurewrold/model/teacher/landing/TeacherEntity.dart';
import 'package:futurewrold/model/teacher/landing/TeacherEntityLanding.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/temp.dart';

class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() {
    // TODO: implement createState
    return new _LoginHomePageState();
  }
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("教师登录", style: new TextStyle(color: Colors.white)),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: Stack(
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
                  child: Image.asset('assets/images/image03.png'),
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
      ),
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
                  labelText: "用户名或邮箱",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person)),
              // 校验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
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
                  TeacherLanding teacherLandingParameter = new TeacherLanding();
                  teacherLandingParameter.password = password;
                  Teacher teacherParameter = new Teacher();
                  teacherParameter.teachernumber = userNumber.toString();
                  teacherLandingParameter.teacher = teacherParameter;
                  teacherLandingVerification('/teacher/landing', teacherLandingParameter);
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

  teacherLandingVerification(String url, TeacherLanding parameter) async {
    var result = await HttpUtils.request(
      url,
      method: HttpUtils.POST,
      data: parameter.toJson(),
    );
    ReturnTeacherLanding returnTeacherLanding = ReturnTeacherLanding.fromJson(result);
    if (returnTeacherLanding.returnKey == true) {
      print("登陆成功");


    } else {
      print("登陆失败");

    }
  }

  _toRegisterPage(BuildContext context) async{
    final preEmail = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new MyApp1()));
  }

}

