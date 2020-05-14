import 'package:flutter/material.dart';

class ApplicationPaperDialog extends StatefulWidget {

  String paperId;

  String paperTitle;


  ApplicationPaperDialog(this.paperId, this.paperTitle);

  @override
  _ApplicationPaperDialogState createState() => _ApplicationPaperDialogState(this.paperId, this.paperTitle);
}

class _ApplicationPaperDialogState extends State<ApplicationPaperDialog> {

  String paperId;

  String paperTitle;

  _ApplicationPaperDialogState(this.paperId, this.paperTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: new Text('申请毕业设计'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('题目：' + paperTitle),
              new Text('申请人姓名：'),
              new Text('申请人编号：'),
            ],
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
      ),
    );
  }
}
