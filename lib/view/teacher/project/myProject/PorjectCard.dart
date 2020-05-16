
import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/getMyPorject/ReturnObject.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    Icon tempIcon;
    Text tempTitle;
    Text tempText;
    tempTitle = new Text(returnObject.title, style: TextStyle(fontSize: 24),);
    if(returnObject.isselect == 1) {
      tempIcon = Icon(Icons.check_circle, color: Colors.green, size: 32,);
      tempText = Text('已申请');
    } else {
      tempIcon = Icon(Icons.block, color: Colors.yellow, size: 32,);
      tempText = Text('未申请');
    }
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
                    padding: const EdgeInsets.all(12.0),
                    child: new ListTile(
                      leading: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: tempIcon,
                      ),
                      title: tempTitle,
                      subtitle: tempText,
                    ),
                  ),
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButtonColumn(Icons.file_download, '下载'),
                        buildButtonColumn(Icons.delete_forever, '删除'),
                        buildButtonColumn(Icons.call_made, '申请信息'),
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


