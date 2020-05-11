
import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/getMyPorject/ReturnObject.dart';

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
      home: Scaffold(
        appBar: new AppBar(title: Text("12345"),),
        body: Container(
          child: ProjectCard(new ReturnObject()),
        ),
      ),
    );
  }
}

// {"id":20,
// "teacherid":67159002,
// "title":"手电筒发光原理",
// "fileurl":"http://127.0.0.1:8080/File/downloadFile/00用例图.pdf",
// "isselect":0,
// "studentnumber":""}

class ProjectCard extends StatefulWidget {

  ReturnObject returnObject;

  ProjectCard(this.returnObject);

  @override
  _ProjectCardState createState() => _ProjectCardState(this.returnObject);
}

class _ProjectCardState extends State<ProjectCard> {

  ReturnObject returnObject;

  _ProjectCardState(this.returnObject);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 180,
        alignment: Alignment.center,
        child: new Padding(
          padding: new EdgeInsets.only(left: 5.0, top: 5.0),
          child: Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(32.0),
                    child: new Row(
                      children: [
                        new Icon(
                          Icons.star,
                          color: Colors.red[500],
                        ),
                        new SizedBox(width: 10,),
                        new Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Container(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: new Text(
                                  returnObject.title,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              new Text(
                                'Kandersteg, Switzerland',
                                style: new TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButtonColumn(Icons.file_download, 'download'),
                        buildButtonColumn(Icons.delete_forever, 'dalete'),
                        buildButtonColumn(Icons.call_made, 'Approve'),
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
    );
  }

  Column buildButtonColumn(IconData icon, String label) {
    Color color = Colors.blue;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}


