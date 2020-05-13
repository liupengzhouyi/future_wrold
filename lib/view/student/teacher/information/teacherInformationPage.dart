import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/teacher/information/ReturnObject.dart';
import 'package:futurewrold/model/student/teacher/information/ReturnSelectTeacherByNumber.dart';
import 'package:futurewrold/model/student/teacher/information/SelectTeacherByNumber.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

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
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Image.network(userInformation.imageurl),
        SizedBox(height: 100,),
        Container(
            width:172.0,
            height:172.0,
            decoration:BoxDecoration(
                shape:BoxShape.circle,
                image:DecorationImage(
                  image: NetworkImage(returnObject.imageurl),
                )
            )
        ),
        SizedBox(height: 5,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text('姓名：', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
            Expanded(
              child: Text(returnObject.name, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: <Widget>[
            Expanded(
              child: Text('专业编号', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
            Expanded(
              child: Text(returnObject.professionalid, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: <Widget>[
            Expanded(
              child: Text('电话号码', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
            Expanded(
              child: Text(returnObject.phonenumber, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
        SizedBox(height: 20,),
        RaisedButton(
            color: Colors.blueAccent,
            child: Text("我的题目"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10) //设置圆角
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    // builder: (context) => SelectMyProject(),
                  )
              );
            }
        ),
        SizedBox(height: 20,),
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
