import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Selecttitle.dart';
import 'package:futurewrold/model/teacher/project/select/applicationInformation/Student.dart';
import 'package:futurewrold/view/teacher/project/application/passDialog/ApplicationDialog.dart';


class PassApplicaationPage extends StatefulWidget {

  PassApplicaationPage(this.student, this.selecttitle);

  Student student;

  Selecttitle selecttitle;

  @override
  _PassApplicaationPageState createState() => _PassApplicaationPageState(this.student, this.selecttitle);


}

class _PassApplicaationPageState extends State<PassApplicaationPage> {

  _PassApplicaationPageState(this.student, this.selecttitle);

  Student student;

  Selecttitle selecttitle;

  Widget page;

  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.check_circle,
        color: Colors.lightBlueAccent,
        size: 64,
      ),
    );
    showInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("批准申请"),
      ),
      body: page,
    );
  }

  void showInformation() {
    page = ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(student.imageurl),
          ),
          title: Text('申请人'),
          subtitle: Text(student.name, style: TextStyle(fontSize: 24),),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.school, color: Colors.green,),
          ),
          title: Text('学号'),
          subtitle: Text(student.studentid, style: TextStyle(fontSize: 24),),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.camera_roll, color: Colors.green,),
          ),
          title: Text('专业编号'),
          subtitle: Text(student.prodessionalid.toString(), style: TextStyle(fontSize: 24),),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.date_range, color: Colors.lightBlueAccent,),
          ),
          title: Text('申请日期'),
          subtitle: Text(selecttitle.applicationdata, style: TextStyle(fontSize: 24),),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtonColumn(Icons.cancel, '不通过', 2,  Colors.red,),
            buildButtonColumn(Icons.check_circle, '通过', 1, Colors.green,),
          ],
        ),
      ],
    );
    setState(() {
      page;
    });
  }




  Column buildButtonColumn(IconData icon, String label, int index, Color color) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new IconButton(
          icon: new Icon(icon, color: color, size: 64,),
          onPressed: () {
            if (index == 1) {
              applicationTitle();
            }
            if (index == 2) {
              Navigator.of(context).pop();
            }
          },
          color: Colors.blueAccent,
          highlightColor: Colors.red,
        ),
      ],
    );
  }

  applicationTitle() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ApplicationDialog(selecttitle.id.toString());
      },
    ).then((val) {
      print(val);
    });
  }



}
