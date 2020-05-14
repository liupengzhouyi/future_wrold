import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/information/GetMyPaperInformation.dart';
import 'package:futurewrold/model/student/myProject/information/Project.dart';
import 'package:futurewrold/model/student/myProject/information/ReturnMyPaperInformation.dart';
import 'package:futurewrold/model/student/myProject/information/ReturnObject.dart';
import 'package:futurewrold/model/student/myProject/information/Selecttitle.dart';
import 'package:futurewrold/model/student/myProject/information/Student.dart';
import 'package:futurewrold/model/student/myProject/information/Teacher.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/student/myProject/information/InformationAir.dart';
import 'package:futurewrold/view/student/myProject/information/InformationPro.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class MyPaperPage extends StatefulWidget {

  String userNumber;


  MyPaperPage(this.userNumber);

  @override
  _MyPaperPageState createState() => _MyPaperPageState(this.userNumber);
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
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
      body: page,
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
    ReturnMyPaperInformation returnMyPaperInformation = ReturnMyPaperInformation.fromJson(result);
    if (returnMyPaperInformation.returnKey == true) {
      ReturnObject returnObject = returnMyPaperInformation.returnObject;
      page = createSuccessPage(returnObject);
      setState(() {
        page;
      });
    } else {
      Student student = returnMyPaperInformation.returnObject.student;
      page = InformationAir(student);
      setState(() {
        page;
      });
    }
  }

  Widget createSuccessPage(ReturnObject returnObject) {
    Student student = Student.fromJson(returnObject.student.toJson());
    Teacher teacher = Teacher.fromJson(returnObject.teacher.toJson());
    Selecttitle selectTitle = Selecttitle.fromJson(returnObject.selecttitle.toJson());
    Project project = Project.fromJson(returnObject.project.toJson());
    return InformationPro(student, teacher, selectTitle, project);
  }
}