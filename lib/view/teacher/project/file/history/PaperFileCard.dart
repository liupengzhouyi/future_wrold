

import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/file/history/ReturnObject.dart';

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
    createCard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  void createCard() {
    Icon tempIcon;
    Text tempText;
    Icon tempUser;
    Text tempInformation;
    if (returnObject.introduction.length > 16) {
      returnObject.introduction = returnObject.introduction.substring(0, 16) + '...';
    }
    tempInformation = new Text(returnObject.introduction);
    tempIcon = Icon(Icons.check_circle_outline, size: 24, color: Colors.red,);
    tempText = new Text('版本：' + returnObject.version);
    tempUser = Icon(Icons.youtube_searched_for, size: 24, color: Colors.black,);
    page = Container(
      color: Colors.white,
      height: 160,
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
                    subtitle: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        tempInformation,
                        new Row(
                          children: <Widget>[
                            tempUser,
                            tempText,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButtonColumn(Icons.file_download, '下载', 1, Colors.black),
                      buildButtonColumn(Icons.chat, '指导记录', 2, Colors.red),
                      buildButtonColumn(Icons.list, '详情', 3, Colors.lightBlueAccent),
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
            if (index == 1) {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    // builder: (context) => PaperHistoryFilePage(returnObject.titleid.toString(), returnObject.name)
                  )
              );
            }
            if(index == 2) {
              Text teacherApproval = new Text('导师未批改');
              Text ApprovalDate;
              // print('returnObject.approval.toString().length:' + returnObject.approval.toString().length.toString());
              if (returnObject.approval.toString().length.toString() == '0') {
                teacherApproval = new Text('导师未批改');
                ApprovalDate = new Text('');
              } else {
                teacherApproval = new Text(returnObject.approval.toString());
                ApprovalDate = new Text(returnObject.approvaldata.toString());
              }
              returnObject.approval.toString();
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: new Text('导师意见'),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          teacherApproval,
                          ApprovalDate,
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('确定'),
                        onPressed: () {
                          // applicationPaperFunction();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ).then((val) {
                print(val);
              });
            }
            if (index == 3) {
              Text teacherApproval = new Text('无详情');
              if (returnObject.introduction.toString().length.toString() == '0') {
                teacherApproval = new Text('无详情');
              } else {
                teacherApproval = new Text(returnObject.introduction);
              }
              returnObject.approval.toString();
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: new Text('详情'),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          teacherApproval,
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('确定'),
                        onPressed: () {
                          // applicationPaperFunction();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ).then((val) {
                print(val);
              });
            }
          },
          color: Colors.blueAccent,
          highlightColor: Colors.red,
        ),
      ],
    );
  }

}
