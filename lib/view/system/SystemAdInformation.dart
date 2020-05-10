import 'package:flutter/material.dart';
import 'package:futurewrold/model/system/ad/SystemInformation.dart';
import 'package:futurewrold/model/system/ad/getone/ReturnObject.dart';
import 'package:futurewrold/model/system/ad/getone/ReturnSystemInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';


void main() {
  runApp(
      new MaterialApp(
        home: SystemADInformation(1),
      )
  );
}

class SystemADInformation extends StatefulWidget {

  int id;

  SystemADInformation(this.id);

  @override
  _SystemADInformationState createState() => _SystemADInformationState(id);
}

class _SystemADInformationState extends State<SystemADInformation> {

  _SystemADInformationState(this.id);

  int id;
  String url = '/SystemInformation/select';
  SystemInformation systemInformation;
  Widget page;

  @override
  void initState() {
    systemInformation = new SystemInformation();
    systemInformation.id = id;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('公告信息'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: page,
        )
    );
  }


  getData() async {
    var result = await HttpUtils.request(url, method: HttpUtils.POST, data: systemInformation.toJson());
    ReturnSystemInformation returnSystemInformation = ReturnSystemInformation.fromJson(result);
    ReturnObject returnObject = returnSystemInformation.returnObject;
    String data = returnObject.lpyear.toString() + "-" + returnObject.lpmonth.toString() + "-" + returnObject.lpday.toString();
    page = new ListView(
      children: <Widget>[
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(left: 20.0, top: 5.0),
              child: new Text(
                returnObject.title,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 24.0
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 20.0, top: 5.0),
              child: new Text(
                data,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 16.0
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 5.0, top: 5.0),
              child: Card(
                elevation: 15.0,  //设置阴影
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
                child: new Column(  // card只能有一个widget，但这个widget内容可以包含其他的widget
                  children: [
                    new ListTile(
                      subtitle: new Text(
                          returnObject.lpcontent
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
    setState(() {
      page;
    });
  }

}
