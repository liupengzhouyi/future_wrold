import 'package:flutter/material.dart';
import 'package:futurewrold/model/system/ad/ReturnObject.dart';
import 'package:futurewrold/utils/page/TempPage.dart';
import 'package:futurewrold/view/system/SystemAdInformation.dart';

class MyTimeLine extends StatefulWidget{

  MyTimeLine(this.returnObject);

  ReturnObject returnObject;

  @override
  _TimeLineState createState() => _TimeLineState(this.returnObject);

}

class _TimeLineState extends State<MyTimeLine>{

  ReturnObject returnObject;

  _TimeLineState(this.returnObject);

  @override
  Widget build(BuildContext context) {
    String data = "";
    int maxLength = 75;
    if (returnObject.lpcontent.length > maxLength) {
      returnObject.lpcontent = returnObject.lpcontent.substring(0, maxLength);
    }
    if (returnObject.title.toString().length > 11) {
      returnObject.title = returnObject.title.substring(0, 11) + '...';
    }
    String content = returnObject.lpcontent + "...";
    data = returnObject.lpyear.toString() + "-" + returnObject.lpmonth.toString() + "-" + returnObject.lpday.toString();
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 30.0,
                child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.only(left: 12.0),
                        child: new VerticalSeparator(),
                      ),
                      new Container(
                        padding: new EdgeInsets.only(),
                        child: new Icon(Icons.access_time, color: Colors.orange),
                        decoration: new BoxDecoration( color: Colors.white, shape: BoxShape.circle),)
                    ],
                  ),
                ),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0, top: 5.0),
                      child: new Text(
                        returnObject.title,
                        style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 24.0
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0, top: 5.0),
                      child: new Text(
                        data,
                        style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 16.0
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Card(
                        elevation: 15.0,  //设置阴影
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
                        child: new Column(  // card只能有一个widget，但这个widget内容可以包含其他的widget
                          children: [
                            new ListTile(
                              title: new Text(returnObject.title,
                                  style: new TextStyle(fontWeight: FontWeight.w500)),
                              subtitle: new Text(
                                  content
                              ),
                              onTap: () {
                                String title = 'returnObject.id:' + returnObject.id.toString();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SystemADInformation(returnObject.id),));
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class VerticalSeparator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 4.0),
        height: 170.0,
        width: 1.0,
        color: Colors.blue
    );
  }
}
