

import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/select/ReturnObject.dart';

class PaperFileCard extends StatefulWidget {

  PaperFileCard(this.returnObject);

  ReturnObject returnObject;

  @override
  _PaperFileCardState createState() => _PaperFileCardState(this.returnObject);


}

class _PaperFileCardState extends State<PaperFileCard> {

  _PaperFileCardState(this.returnObject);

  ReturnObject returnObject;

  Widget page;


  @override
  void initState() {
    creaetCard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  void creaetCard() {
    Icon tempIcon;
    Text tempText;
    Icon tempUser;
    tempIcon = Icon(Icons.check_circle_outline, size: 24, color: Colors.red,);
    tempText = new Text('版本：' + returnObject.version);
    tempUser = Icon(Icons.youtube_searched_for, size: 24, color: Colors.black,);
    page = Container(
      color: Colors.white,
      height: 150,
      alignment: Alignment.center,
      child: new Padding(
        padding: new EdgeInsets.only(left: 5.0, top: 5.0),
        child: Card(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.white,
                      child: tempIcon,
                    ),
                    title: new Text(returnObject.name, style: TextStyle(fontSize: 24),),
                    subtitle: new Row(
                      children: <Widget>[
                        tempUser,
                        tempText,
                      ],
                    ),
                  ),
                ),
                new Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButtonColumn(Icons.file_download, '下载', 1, Colors.blue),
                      buildButtonColumn(Icons.access_time, '历史记录', 2, Colors.lightGreenAccent),
                      buildButtonColumn(Icons.chat, '指导记录', 3, Colors.red),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
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
          icon: new Icon(icon, color: color),
          onPressed: () {

          },
          color: Colors.blueAccent,
          highlightColor: Colors.red,
        ),
      ],
    );
  }

}
