
import 'package:flutter/material.dart';
import 'package:futurewrold/model/system/ad/ReturnObject.dart';
import 'package:futurewrold/model/system/ad/ReturnSystemAD.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/system/MyTimeLine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetAllSystemAD(),
    );
  }
}

class GetAllSystemAD extends StatefulWidget {
  @override
  _GetAllSystemADState createState() => _GetAllSystemADState();
}

class _GetAllSystemADState extends State<GetAllSystemAD> {

  Widget page;
  String url = '/SystemInformation/getAll';
  List<ReturnObject> list;
  bool key = false;

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Container(
      child: page,
    );
  }

  getData() async {
    var result = await HttpUtils.request(url, method: HttpUtils.POST,);
    ReturnSystemAD returnSystemAD = ReturnSystemAD.fromJson(result);
    list = returnSystemAD.returnObject;
    List<Widget> listWidget = new List();
    listWidget.add(new Padding(padding: new EdgeInsets.only(top: 20.0)));
    if (list.length == 0) {
      print('没有数据');
    } else {
      for (int i = list.length-1; i>=0; i--) {
        listWidget.add(MyTimeLine(list[i]));
      }
      page = Scaffold(
        body: new ListView(
          children: listWidget,
        ),
      );
      setState(() {
        page;
      });
    }
  }
}
