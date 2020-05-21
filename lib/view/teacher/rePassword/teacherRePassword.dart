import 'package:flutter/material.dart';
import 'package:futurewrold/main.dart';
import 'package:futurewrold/model/teacher/rePassword/ReturnTeacherRePasswordEntity.dart';
import 'package:futurewrold/model/teacher/rePassword/Teacher.dart';
import 'package:futurewrold/model/teacher/rePassword/TeacherRePasswordEntity.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class TeacherRePassword extends StatefulWidget {

  TeacherRePassword(this.teacherNumber);

  String teacherNumber;

  @override
  _TeacherRePasswordState createState() => _TeacherRePasswordState(this.teacherNumber);
}

class _TeacherRePasswordState extends State<TeacherRePassword> {

  _TeacherRePasswordState(this.teacherNumber);

  String teacherNumber;

  final _formKey = GlobalKey<FormState>();
  Color _eyeColor0;
  Color _eyeColor1;
  Color _eyeColor2;
  bool _isClickEye1 = false;
  bool _isClickEye2 = false;
  bool _isClickEye3 = false;
  String password;
  String password1;
  String password2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('修改密码'),),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[

              initLoginPWD0(),
              SizedBox(height:30.0),
              initLoginPWD1(),
              SizedBox(height:10.0),
              initLoginPWD2(),
              SizedBox(height:50.0),
              initButton(),
            ],
          ),
        )

    );
  }

  TextFormField initLoginPWD0(){
    return TextFormField(
      obscureText: _isClickEye1,
      onSaved: (String value) => password = value,
      validator: (String value){
        if(value.isEmpty){
          return '原密码不能为空';
        }
      },
      decoration: InputDecoration(
        labelText: '原密码',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,color: _eyeColor0),
            onPressed:(){
              setState(() {
                _isClickEye1 = !_isClickEye1;
                _eyeColor0 = _isClickEye1 ? Colors.grey: Colors.blue;
              });
            }
        ),
      ),
    );
  }

  TextFormField initLoginPWD1(){
    return TextFormField(
      obscureText: _isClickEye2,
      onSaved: (String value) => password1 = value,
      validator: (String value){
        if(value.isEmpty){
          return '新密码不能为空';
        }
      },
      decoration: InputDecoration(
        labelText: '新密码',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,color: _eyeColor1),
            onPressed:(){
              setState(() {
                _isClickEye2 = !_isClickEye2;
                _eyeColor1 = _isClickEye2 ? Colors.grey: Colors.blue;
              });
            }
        ),
      ),
    );
  }

  TextFormField initLoginPWD2(){
    return TextFormField(
      obscureText: _isClickEye3,
      onSaved: (String value) => password2 = value,
      validator: (String value){
        if(value.isEmpty){
          return '确认密码不能为空';
        }
      },
      decoration: InputDecoration(
        labelText: '确认密码',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,color: _eyeColor2),
            onPressed:(){
              setState(() {
                _isClickEye3 = !_isClickEye3;
                _eyeColor2 = _isClickEye3? Colors.grey: Colors.blue;
              });
            }
        ),
      ),
    );
  }

  Align initButton(){
    return Align(
      child: SizedBox(
        width: 300.0,
        height: 50.0,
        child: RaisedButton(
          child: Text('修改密码',style: TextStyle(color: Colors.white),),
          color: Colors.blueAccent,
          onPressed: (){
            //CommonUtils.showToast(context, '登录');
            if(_formKey.currentState.validate()){
              _formKey.currentState.save();
              TeacherRePasswordEntity teacherRePasswordEntity = new TeacherRePasswordEntity();
              Teacher teacher =  new Teacher();
              teacher.teachernumber = teacherNumber;
              teacherRePasswordEntity.password = password;
              teacherRePasswordEntity.password1 = password1;
              teacherRePasswordEntity.password2 = password2;
              teacherRePasswordEntity.teacher = teacher;
              rePass(teacherRePasswordEntity);
            }
          },
          shape: StadiumBorder(side: BorderSide(color: Colors.blueAccent)),
        ),
      ),
    );
  }


  Future<void> rePass(TeacherRePasswordEntity teacherRePasswordEntity) async {
    var result = await HttpUtils.request(
      '/teacher/rePassword',
      method: HttpUtils.POST,
      data: teacherRePasswordEntity.toJson(),
    );
    ReturnTeacherRePasswordEntity returnTeacherRePasswordEntity = ReturnTeacherRePasswordEntity.fromJson(result);
    if (returnTeacherRePasswordEntity.returnKey == true) {
      password = '';
      password1 = '';
      password2 = '';
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('教师修改密码'),
            content: new SingleChildScrollView(
              child: new Center(
                child: Text(returnTeacherRePasswordEntity.why + '下次登陆生效'),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
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
      password = '';
      password1 = '';
      password2 = '';
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('教师修改密码'),
            content: new SingleChildScrollView(
              child: new Center(
                child: Text(returnTeacherRePasswordEntity.why),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
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


}
