
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:futurewrold/model/utils/file/image/ReturnObject.dart';
import 'package:futurewrold/model/teacher/project/add/ReturnTeacherAddProject.dart';
import 'package:futurewrold/model/teacher/project/add/TeacherAddProject.dart';
import 'package:futurewrold/model/utils/file/image/ReturnUploadFile.dart';
import 'package:futurewrold/utils/page/TempPage.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class TeacherAddProjectPage extends StatefulWidget {

  String teacherNumber;

  TeacherAddProjectPage(this.teacherNumber);

  @override
  _TeacherAddProjectPageState createState() => _TeacherAddProjectPageState(this.teacherNumber);
}

class _TeacherAddProjectPageState extends State<TeacherAddProjectPage> {

  _TeacherAddProjectPageState(this.teacherNumber);

  String name;

  String teacherNumber;

  final _formKey = GlobalKey<FormState>();

  TeacherAddProject teacherAddProject = new TeacherAddProject();

  File _lpFlie;

  String lpFileName = "未上传文件";

  @override
  void initState() {
    int number = 0;
    number = int.parse(teacherNumber);
    teacherAddProject.teacherid = number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("添加新题目"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
            SizedBox(height: kToolbarHeight,),
            buildTitle(),
            buildTitleLine(),
            SizedBox(height: 70.0),
            buildTextFieldName('题目', '请输入设计题目'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // container,
                Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        _getFile();
                      },
                      child: Text("选取文件"),
                    ),
                    SizedBox(width: 30),
                    RaisedButton(
                      onPressed: () {
                        _uploadFile(_lpFlie);
                      },
                      child: Text("上传文件"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text('$lpFileName'),
            SizedBox(height: 20.0),
            buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Future _getFile() async {
    var lpFile = await FilePicker.getFile(type: FileType.custom);
    setState(() {
      _lpFlie = lpFile;
    });
  }

  _uploadFile(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName)
    });
    var response = await Dio().post("http://123.56.167.84:8080/File/uploadFile", data: formData);
    print(response);
    ReturnUploadFile returnUploadFile = ReturnUploadFile.fromJson(response.data);
    // print(returnUploadFile.toString());
    setState(() {
      lpFileName = "文件上传失败";
    });
    if (returnUploadFile.returnKey == true) {
      ReturnObject returnObject = ReturnObject.fromJson(returnUploadFile.returnObject.toJson());
      String fileUrl = returnObject.fileDownloadUri;
      print('fileUrl: ' + fileUrl);
      setState(() {
        teacherAddProject.fileurl = fileUrl;
        lpFileName = fileName.toString();
      });
    }
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 170.0,
        child: RaisedButton(
          child: Text(
            '上传',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.black,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 执行登录方法
              addProject();
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  addProject() async {
    teacherAddProject.title = name;
    var result = await HttpUtils.request(
      '/project/add',
      method: HttpUtils.POST,
      data: {
        "fileurl": teacherAddProject.fileurl,
        "id": 0,
        "isselect": 0,
        "studentnumber": "",
        "teacherid": teacherAddProject.teacherid,
        "title": teacherAddProject.title
      },
    );
    ReturnTeacherAddProject returnTeacherAddProject = ReturnTeacherAddProject.fromJson(result);
    if (returnTeacherAddProject.returnKey == true) {
      teacherAddProject = new TeacherAddProject();
      lpFileName = "未上传文件";
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TempPage(title: "Success",),
          )
      );
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TempPage(title: "Error",),
          )
      );
    }
  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 180.0,
          height: 2.0,
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'New Paper',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

  TextFormField buildTextFieldName(String myLabelText, String myValidator) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: myLabelText,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return myValidator;
        }
      },
      onSaved: (String value) => name = value,
    );
  }

}
