

import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/select/ReturnObject.dart';
import 'package:futurewrold/view/student/myProject/history/PaperHistoryFilePage.dart';
import 'package:futurewrold/view/student/myProject/select/UpdateLink.dart';

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
                      buildButtonColumn(Icons.access_time, '历史记录', 2, Colors.lightGreenAccent),
                      buildButtonColumn(Icons.chat, '指导记录', 3, Colors.red),
                      UpdateLink(returnObject.titleid.toString(), returnObject.name, Icons.autorenew, '更新', 4, Colors.lightBlueAccent),
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
            if (index == 2) {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaperHistoryFilePage(returnObject.titleid.toString(), returnObject.name)
                  )
              );
            }
            if (index == 3) {
              Text teacherApproval = new Text('导师未批改');
              Text ApprovalDate;
              print('returnObject.approval.toString().length:' + returnObject.approval.toString().length.toString());
              if (returnObject.approval.toString().length.toString() == '0') {
                print('123456789====456789');
                teacherApproval = new Text('导师未批改');
                ApprovalDate = new Text('');
              } else {
                print('123456789=456789');
                teacherApproval = new Text(
                    returnObject.approval
                );
                ApprovalDate = new Text(
                    returnObject.approvaldata
                );
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
            if (index == 4) {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => PaperHistoryFilePage(returnObject.titleid.toString(), returnObject.name)
                  )
              );
            }
          },
          color: Colors.blueAccent,
          highlightColor: Colors.red,
        ),
      ],
    );
  }

}
