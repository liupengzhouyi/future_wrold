
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurewrold/main.dart';
import 'package:futurewrold/model/student/registered/ReturnStudentRegistered.dart';
import 'package:futurewrold/model/student/registered/Student.dart';
import 'package:futurewrold/model/student/registered/StudentRegistered.dart';
import 'package:futurewrold/model/utils/file/image/ReturnObject.dart';
import 'package:futurewrold/model/utils/file/image/ReturnUploadFile.dart';
import 'package:futurewrold/utils/page/TempPage.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/professional/showProfessionalInformation.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return StudentRegisteredPage();
  }
}

class StudentRegisteredPage extends StatefulWidget {
  @override
  _StudentRegisteredPageState createState() => _StudentRegisteredPageState();
}

class _StudentRegisteredPageState extends State<StudentRegisteredPage> {
  final _formKey = GlobalKey<FormState>();
  String _name, _password1, _password2, _phonenumber, _teachernumber, _professionalid;
  bool _isObscure = true;
  Color _eyeColor;
  String imageUrl = 'http://123.56.167.84:8080/File/downloadFile/userHeadImage.png';
  File _image;
  Container container;

  void initImage() {
    container = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage('$imageUrl'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.initImage();
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("学生注册"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  container,
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          _getImageFromCamera();
                        },
                        child: Text("照相机"),
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                        onPressed: () {
                          _getImageFromGallery();
                        },
                        child: Text("相册"),
                      ),
                    ],
                  ),
                ],
              ),

              buildTextFieldName('姓名', '请输入你的姓名'),
              buildTextFieldProfessionalid('专业编号', '请输入你的专业编号'),
              buildTextFieldTeachernumber('学号', '请输入你的学号'),
              buildTextFieldPassword1(context, "密码"),
              buildTextFieldPassword2(context, "确认密码"),
              buildTextFieldPhoneNumber('电话号码', '请输入你的电话号码'),
              SizedBox(height: 60.0),
              buildLoginButton(context),
              SizedBox(height: 30.0),
              buildRegisterText(context),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  //上传图片到服务器
  _uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName)
    });
    Response response = await Dio().post("http://123.56.167.84:8080/File/uploadFile", data: formData);
    print(response.data.toString());
    ReturnUploadFile returnUploadFile = ReturnUploadFile.fromJson(response.data);
    print(returnUploadFile.toString());
    if (returnUploadFile.returnKey == true) {
      ReturnObject returnObject = ReturnObject.fromJson(returnUploadFile.returnObject.toJson());
      imageUrl = returnObject.fileDownloadUri;
      print('imageUrl: ' + imageUrl);
      setState(() {
        container = Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage('$imageUrl'),),
          ),
        );
      });
    }
  }

  //拍照
  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);
    setState(() {
      _image = image;
    });
    _uploadImage(_image);
  }

  //相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    _uploadImage(_image);
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '注册',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.black,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 执行登录方法
              // print("$_name + $imageUrl + $_password1 + $_password2 + $_phonenumber + $_teachernumber + $_professionalid");
              studentRegistered();
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  Future<void> studentRegistered() async {
    Student student = new Student();
    student.name = _name;
    student.imageurl = imageUrl;
    student.phonenumber = _phonenumber;
    student.prodessionalid = int.parse(_professionalid);
    student.studentid = _teachernumber;
    StudentRegistered studentRegistered = new StudentRegistered();
    studentRegistered.password1 = _password1;
    studentRegistered.password2 = _password2;
    studentRegistered.student = student;
    print(studentRegistered.toJson());
    var result = await HttpUtils.request(
      '/student/addOne',
      method: HttpUtils.POST,
      // data: studentRegistered.toJson(),
      data: {
        "password": "",
        "password1": "$_password1",
        "password2": "$_password2",
        "student": {
          "id": 0,
          "imageurl": "$imageUrl",
          "isdelete": 0,
          "name": "$_name",
          "password": 0,
          "phonenumber": "$_phonenumber",
          "prodessionalid": '$_professionalid',
          "studentid": "$_teachernumber"
        }
      }
    );
    print(result);
    ReturnStudentRegistered returnStudentRegistered = ReturnStudentRegistered.fromJson(result);
    if (returnStudentRegistered.returnKey == true) {
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          )
      );
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TempPage(title: returnStudentRegistered.why,),
          )
      );
    }
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
      onSaved: (String value) => _name = value,
    );
  }

  TextFormField buildTextFieldProfessionalid(String myLabelText, String myValidator) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: myLabelText,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return myValidator;
        }
      },
      onSaved: (String value) => _professionalid = value,
    );
  }

  TextFormField buildTextFieldTeachernumber(String myLabelText, String myValidator) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: myLabelText,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return myValidator;
        }
      },
      onSaved: (String value) => _teachernumber = value,
    );
  }

  TextFormField buildTextFieldPhoneNumber(String myLabelText, String myValidator) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: myLabelText,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return myValidator;
        }
      },
      onSaved: (String value) => _phonenumber = value,
    );
  }

  TextFormField buildTextFieldPassword1(BuildContext context, String myLabelText) {
    return TextFormField(
      onSaved: (String value) => _password1 = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      decoration: InputDecoration(
          labelText: myLabelText,
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  TextFormField buildTextFieldPassword2(BuildContext context, String myLabelText) {
    return TextFormField(
      onSaved: (String value) => _password2 = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入确认密码';
        }
      },
      decoration: InputDecoration(
          labelText: myLabelText,
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 120.0,
          height: 2.0,
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Registered',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Text(
                '查看专业信息',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => ShowProfessionalInformation()
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}


// I/flutter (27203): 请求参数：{password: null, password1: 147258, password2: 1472583, teacher: {id: null, imageurl: http://123.56.167.84:8080/File/downloadFile/userHeadImage.png, isdelete: null, name: 1452, password: null, phonenumber: 14526387459, professionalid: 145236, teachernumber: 145236}}
// I/flutter (27203): 请求参数：{password: null, password1: 123456, password2: 123456, student: {id: null, imageurl: http://123.56.167.84:8080/File/downloadFile/userHeadImage.png, isdelete: null, name: 刘鹏, password: null, phonenumber: 14785623259, prodessionalid: 12323, studentid: 1667156325}}

