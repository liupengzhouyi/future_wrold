import 'package:flutter/material.dart';
import 'package:futurewrold/view/teacher/landing/teacherLanding.dart';
import 'package:futurewrold/view/temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('身份选择'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 157.00,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10.00,),
                addMode(context, MyApp1(), "学生登陆", Image.asset("assets/images/image02.png",fit: BoxFit.fill,)),
                SizedBox(width: 10.00,),
                addMode(context, LoginHomePage(), "教师登陆",Image.asset("assets/images/image03.png",fit: BoxFit.fill,)),
                SizedBox(width: 10.00,),
                addMode(context, MyApp1(), "管理员登陆", Image.asset("assets/images/image04.png",fit: BoxFit.fill,)),
                SizedBox(width: 10.00,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addMode(BuildContext context, Widget tempWidget, String name, Image image) {
    return Expanded(
        flex: 1,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              child: Center(
                  child: Container(
                    width: 250,
                    height: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: image,
                    ),
                  ),
              ),
            ),
            SizedBox(width: 20.00,),
            MaterialButton(
              child: new Text(name, style: new TextStyle(color: Colors.black),),
              color: Colors.lime,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => tempWidget,
                    )
                );
              },
            ),
          ],
        )
    );
  }
}
