import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/applicationInformation/Applicationinformation.dart';
import 'package:futurewrold/model/student/project/applicationInformation/ReturnApplicationInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class ApplicationInformationPage extends StatefulWidget {

  String paperId;

  String paperTitle;

  ApplicationInformationPage(this.paperId, this.paperTitle);

  @override
  _ApplicationInformationPageState createState() => _ApplicationInformationPageState(this.paperId, this.paperTitle);
}

class _ApplicationInformationPageState extends State<ApplicationInformationPage> {

  String paperId;

  String paperTitle;

  Widget page;

  ApplicationInformation applicationInformation = new ApplicationInformation();

  _ApplicationInformationPageState(this.paperId, this.paperTitle);


  @override
  void initState() {
    applicationInformation.titleid = int.parse(paperId);
    page = Center(child: Icon(Icons.add, color: Colors.blue, size: 64,),);
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("申请信息"),),
      body: Container(
        child: page,
      ),
    );
  }

  Future<void> getDate() async {
    var result = await HttpUtils.request(
      '/OtherContrller/selectApplicationTitleInformationByTitle',
      method: HttpUtils.POST,
      data: applicationInformation.toJson(),
    );
    ReturnApplicationInformation returnApplicationInformation = ReturnApplicationInformation.fromJson(result);
    if (returnApplicationInformation.returnKey == true) {

    } else {

    }
  }



}
