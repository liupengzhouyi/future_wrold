

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:futurewrold/model/utils/file/image/ReturnUploadFile.dart';
import 'package:futurewrold/model/utils/file/image/ReturnObject.dart';


class AddNewpaperFilePage extends StatefulWidget {

  AddNewpaperFilePage(this.titleId, this.studentNumber);

  String titleId;

  String studentNumber;

  @override
  _AddNewpaperFilePageState createState() => _AddNewpaperFilePageState(this.titleId, this.studentNumber);
}

class _AddNewpaperFilePageState extends State<AddNewpaperFilePage> {

  _AddNewpaperFilePageState(this.titleId, this.studentNumber);

  String titleId;

  String studentNumber;

  final _formKey = GlobalKey<FormState>();

  String name;

  String introduction;

  String myfileUrl;

  File _lpFlie;

  String lpFileName = "未上传文件";

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("添加毕设记录"),
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
            buildTextFieldInformation('描述', ''),
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
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 执行登录方法
              addPaperFileFunction();
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  addPaperFileFunction() {


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
        'Add Paper File',
        style: TextStyle(fontSize: 32.0),
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
      onSaved: (String value) => introduction = value,
    );
  }
}
