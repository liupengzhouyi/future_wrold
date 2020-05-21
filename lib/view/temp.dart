import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: LoginPage(),
      )
  );
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  Color _eyeColor;
  bool _isClickEye = false;
  String _userName;
  String _pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login'),),
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


  TextFormField initLoginName(){
    return TextFormField(
      onSaved: (String value) => _pwd = value,
      maxLength: 11,
      decoration: InputDecoration(
          labelText: '用户名'
      ),
      validator: (String value){
        var isPhone = RegExp("^1[3456789][0-9]{9}");
        if(!isPhone.hasMatch(value)){
          return '用户名格式不正确';
        }
      },

    );
  }

  TextFormField initLoginPWD0(){
    return TextFormField(
      obscureText: _isClickEye,
      onSaved: (String value) => _userName = value,
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
      onSaved: (String value) => _userName = value,
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
      onSaved: (String value) => _userName = value,
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

  Padding initForgetPwd(){
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child:Text('忘记密码？'),
            onTap: (){
              // CommonUtils.showToast(context, '忘记密码');
            },
          )
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

