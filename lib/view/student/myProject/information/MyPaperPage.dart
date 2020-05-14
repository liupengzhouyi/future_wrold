import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/information/GetMyPaperInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class MyPaperPage extends StatefulWidget {

  String userNumber;


  MyPaperPage(this.userNumber);

  @override
  _MyPaperPageState createState() => _MyPaperPageState(this.userNumber);
}

class _MyPaperPageState extends State<MyPaperPage> {

  String userNumber;

  _MyPaperPageState(this.userNumber);

  Widget page;


  @override
  void initState() {
    page = Center(
      child: Icon(
        Icons.assignment,
        color: Colors.blue,
        size: 64,
      ),
    );
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("我的毕设"),
      ),
      body: Form(
        child: page,
      ),
    );
  }

  Future<void> getData() async {
    GetMyPaperInformation getMyPaperInformation = new GetMyPaperInformation();
    getMyPaperInformation.studentid = userNumber;
    var result = await HttpUtils.request(
      '/OtherContrller/selectMyTitle',
      method: HttpUtils.POST,
      data: getMyPaperInformation.toJson(),
    );

  }

}
