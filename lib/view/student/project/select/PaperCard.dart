import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/select/ReturnObject.dart';

class PaperCard extends StatefulWidget {

  String name;
  ReturnObject returnObject;


  PaperCard(this.name, this.returnObject);

  @override
  _PaperCardState createState() => _PaperCardState(this.name, this.returnObject);
}

class _PaperCardState extends State<PaperCard> {

  String name;
  ReturnObject returnObject;


  _PaperCardState(this.name, this.returnObject);

  @override
  Widget build(BuildContext context) {
    return createItem();
  }

  Widget createItem() {
    Icon tempIcon;
    Text tempText;
    Icon tempUser;
    if (returnObject.isselect == 1) {
      tempIcon = Icon(Icons.book, size: 24, color: Colors.red,);
      tempText = new Text('已申请');
      tempUser = Icon(Icons.person, size: 24, color: Colors.black,);
    } else {
      tempIcon = Icon(Icons.bookmark, size: 24, color: Colors.green, );
      tempText = new Text('未申请');
      tempUser = Icon(Icons.perm_identity, size: 24, color: Colors.green,);
    }

    return Container(
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
                    title: new Text(returnObject.title, style: TextStyle(fontSize: 24),),
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
                      buildButtonColumn(Icons.file_download, '下载'),
                      buildButtonColumn(Icons.verified_user, '申请'),
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
