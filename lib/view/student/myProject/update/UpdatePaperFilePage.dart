import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/update/ReturnUpdatePaperFile.dart';
import 'package:futurewrold/model/student/myProject/update/UpdatePaperFile.dart';
import 'package:futurewrold/model/utils/file/image/ReturnUploadFile.dart';
import 'package:futurewrold/model/utils/file/image/ReturnObject.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class UpdatePaperFilePage extends StatefulWidget {

  UpdatePaperFilePage(this.titleId, this.studentNumber, this.name);

  String titleId;

  String studentNumber;

  String name;

  @override
  _UpdatePaperFilePageState createState() => _UpdatePaperFilePageState(this.titleId, this.studentNumber, this.name);
}

class _UpdatePaperFilePageState extends State<UpdatePaperFilePage> {

  _UpdatePaperFilePageState(this.titleId, this.studentNumber, this.name);

  String titleId;

  String studentNumber;

  String name;

  String introduction;

  String myfileUrl;

  Widget page;

  final _formKey = GlobalKey<FormState>();

  File _lpFlie;

  String lpFileName = "未上传文件";

  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.chat,
        color: Colors.lightBlueAccent,
        size: 64,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    createInitPage();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("更新毕设记录"),
        ),
        body:page,
    );
  }

  void createInitPage() {
    page = Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
            SizedBox(height: kToolbarHeight,),
            buildTitle(),
            buildTitleLine(),
            SizedBox(height: 70.0),
            buildTitletemp(),
            buildTextFieldInformation('描述', '请输入描述'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
    );
    setState(() {
      page;
    });
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
        myfileUrl = fileUrl;
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
            print('myfileUrl.length:' + myfileUrl.toString().length.toString());
            if (myfileUrl.toString().length == 4) {
              if (lpFileName.length < 20) {
                lpFileName = lpFileName + '.';
              }
              setState(() {
                lpFileName;
              });
            } else {
              if (_formKey.currentState.validate()) {
                ///只有输入的内容符合要求通过才会到达此处
                _formKey.currentState.save();
                //TODO 执行登录方法
                addPaperFileFunction();
              }
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  addPaperFileFunction() async {

    UpdatePaperFile updatePaperFile = new UpdatePaperFile();
    updatePaperFile.name = name;
    updatePaperFile.introduction = introduction;
    updatePaperFile.titleid = int.parse(titleId);
    updatePaperFile.studentnumber = studentNumber;
    updatePaperFile.fileurl = myfileUrl;
    var result = await HttpUtils.request(
      '/projectfile/update',
      method: HttpUtils.POST,
      data: updatePaperFile.toJson(),
    );
    ReturnUpdatePaperFile returnUpdatePaperFile = ReturnUpdatePaperFile.fromJson(result);
    if (returnUpdatePaperFile.returnKey == true) {
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('更新毕业设计文件'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('更新成功'),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  // applicationPaperFunction();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ).then((val) {
        print(val);
      });
    } else {
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('更新毕业设计文件'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('更新失败'),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  // applicationPaperFunction();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ).then((val) {
        print(val);
      });
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
        'Update Paper File',
        style: TextStyle(fontSize: 28.0),
      ),
    );
  }

  Padding buildTitletemp() {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Text(
        name,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  TextFormField buildTextFieldInformation(String myLabelText, String myValidator) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: myLabelText,
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return myValidator;
          }

        },
        onSaved: (String value) {
          introduction= value;
          setState(() {
            introduction;
          });
        }
    );
  }

}
