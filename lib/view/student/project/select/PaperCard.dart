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
