import 'package:flutter/material.dart';

class ApplicationDialog extends StatefulWidget {

  String id;


  ApplicationDialog(this.id);

  @override
  _ApplicationDialogState createState() => _ApplicationDialogState(this.id);
}

class _ApplicationDialogState extends State<ApplicationDialog> {

  String id;


  _ApplicationDialogState(this.id);

  Widget page;

  @override
  void initState() {
    page = AlertDialog(
      title: new Text('批准毕业设计申请'),
      content: new SingleChildScrollView(
        child: new Center(
          child: Icon(Icons.find_replace, color: Colors.lightGreenAccent, size: 64,),
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text('确定'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }
}
