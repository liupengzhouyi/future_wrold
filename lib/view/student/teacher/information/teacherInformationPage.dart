import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/teacher/information/ReturnObject.dart';
import 'package:futurewrold/model/student/teacher/information/ReturnSelectTeacherByNumber.dart';
import 'package:futurewrold/model/student/teacher/information/SelectTeacherByNumber.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/student/project/select/SelectTeacherPaper.dart';

class TeacherInformationPage extends StatefulWidget {

  String teachernumber;


  TeacherInformationPage(this.teachernumber);

  @override
  _TeacherInformationPageState createState() => _TeacherInformationPageState(this.teachernumber);
}

class _TeacherInformationPageState extends State<TeacherInformationPage> {

  _TeacherInformationPageState(this.teachernumber);

  String teachernumber;

  SelectTeacherByNumber selectTeacherByNumber = new SelectTeacherByNumber();

  Widget page;

  @override
  void initState() {
    selectTeacherByNumber.teachernumber = this.teachernumber;
    getData();
    page = Icon(Icons.access_alarms, color: Colors.lightGreen, size: 28,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("教师信息"),),
      body: Container(
        child: page,
      ),
    );
  }

  Future<void> getData() async {
    var result = await HttpUtils.request(
        '/teacher/selectByNumber',
        method: HttpUtils.POST,
        data: selectTeacherByNumber.toJson(),
    );
    print(result);
    ReturnSelectTeacherByNumber returnSelectTeacherByNumber = ReturnSelectTeacherByNumber.fromJson(result);
    if (returnSelectTeacherByNumber.returnKey == true) {
      ReturnObject returnObject = returnSelectTeacherByNumber.returnObject;
      createSuccessPage(returnObject);
    } else {
      createErrorPage();
    }
  }

  createSuccessPage(ReturnObject returnObject) {

    page = new ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        ListTile(
          leading: new CircleAvatar(
            // child: Icon(Icons.account_circle, size: 24, ),
            backgroundImage: NetworkImage(returnObject.imageurl),
          ),
          title: new Text(returnObject.name, style: TextStyle(fontSize: 24),),
        ),
        SizedBox(height: 5,),
        ListTile(
          leading: new CircleAvatar(
            child: Icon(Icons.school, size: 24, ),
          ),
          title: new Text(returnObject.teachernumber, style: TextStyle(fontSize: 24),),
        ),
        SizedBox(height: 5,),
        ListTile(
          leading: new CircleAvatar(
            child: Icon(Icons.account_balance, size: 24, ),
          ),
          title: new Text(returnObject.professionalid, style: TextStyle(fontSize: 24),),
        ),
        SizedBox(height: 5,),
        ListTile(
          leading: new CircleAvatar(
            child: Icon(Icons.phone, size: 24, ),
          ),
          title: new Text(returnObject.phonenumber, style: TextStyle(fontSize: 24),),
        ),
        SizedBox(height: 20,),
        RaisedButton(
            color: Colors.blueAccent,
            child: Text("查看题目"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10) //设置圆角
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectTeacherPaper(returnObject.teachernumber, returnObject.name),
                  )
              );
            }
        ),
      ],
    );
    setState(() {
      page = page;
    });
  }

  createErrorPage() {
    page = Text('没有数据');
  }

}
