import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/application/PassStudentApplication.dart';
import 'package:futurewrold/model/teacher/project/select/application/ReturnPassStudentApplication.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

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
          child: Icon(Icons.call_split, color: Colors.lightGreenAccent, size: 128,),
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
            passApplication();
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


  Future<void> passApplication() async {
    PassStudentApplication passStudentApplication = new PassStudentApplication();
    passStudentApplication.id = int.parse(id);
    var result = await HttpUtils.request(
      '/selecttitle/pass',
      method: HttpUtils.POST,
      data: passStudentApplication.toJson(),
    );
    ReturnPassStudentApplication returnPassStudentApplication = ReturnPassStudentApplication.fromJson(result);
    if (returnPassStudentApplication.returnKey == true) {
      page = AlertDialog(
        title: new Text('批准毕业设计申请'),
        content: new SingleChildScrollView(
          child: new Center(
              child: Column(
                children: <Widget>[
                  Icon(Icons.check, color: Colors.green, size: 128,),
                  Text('通过成功')
                ],
              )
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
      setState(() {
        page;
      });
    } else {
      page = AlertDialog(
        title: new Text('批准毕业设计申请'),
        content: new SingleChildScrollView(
          child: new Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.close, color: Colors.red, size: 128,),
                Text('通过失败')
              ],
            )
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
      setState(() {
        page;
      });
    }
  }

}
