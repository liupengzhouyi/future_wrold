import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAlertDialog(),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AlertDialog组件示例'),
        ),
        body: Center(
          child: AlertDialog(
            title: Text('错误'), //对话框标题
            content: SingleChildScrollView(
              //对话框内容部分
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}