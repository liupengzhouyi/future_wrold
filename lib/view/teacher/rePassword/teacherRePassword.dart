import 'package:flutter/material.dart';

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
  Color _eyeColor;
  bool _isClickEye = false;
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
      obscureText: _isClickEye,
      onSaved: (String value) => password = value,
      validator: (String value){
        if(value.isEmpty){
          return '原密码不能为空';
        }
      },
      decoration: InputDecoration(
        labelText: '原密码',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,color: _eyeColor),
            onPressed:(){
              setState(() {
                _isClickEye = !_isClickEye;
                _eyeColor = _isClickEye ? Colors.grey: Colors.blue;
              });
            }
        ),
      ),
    );
  }

  TextFormField initLoginPWD1(){
    return TextFormField(
      obscureText: _isClickEye,
      onSaved: (String value) => password1 = value,
      validator: (String value){
        if(value.isEmpty){
          return '新密码不能为空';
        }
      },
      decoration: InputDecoration(
        labelText: '新密码',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,color: _eyeColor),
            onPressed:(){
              setState(() {
                _isClickEye = !_isClickEye;
                _eyeColor = _isClickEye ? Colors.grey: Colors.blue;
              });
            }
        ),
      ),
    );
  }

  TextFormField initLoginPWD2(){
    return TextFormField(
      obscureText: _isClickEye,
      onSaved: (String value) => password2 = value,
      validator: (String value){
        if(value.isEmpty){
          return '确认密码不能为空';
        }
      },
      decoration: InputDecoration(
        labelText: '确认密码',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,color: _eyeColor),
            onPressed:(){
              setState(() {
                _isClickEye = !_isClickEye;
                _eyeColor = _isClickEye ? Colors.grey: Colors.blue;
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
              // CommonUtils.showToast(context, _userName+"----"+_pwd);
            }

          },
          shape: StadiumBorder(side: BorderSide(color: Colors.blueAccent)),
        ),
      ),
    );
  }


}
