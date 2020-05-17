import 'package:flutter/material.dart';
import 'package:futurewrold/view/teacher/chat/chatting/Chatting.dart';
import 'package:futurewrold/view/teacher/chat/getChatInformation/ChatList.dart';

class TeacherChatPage extends StatefulWidget {

  TeacherChatPage(this.groupId, this.groupName, this.myNumber);

  String myNumber;
  String groupId;
  String groupName;

  @override
  _TeacherChatPageState createState() => _TeacherChatPageState(this.groupId, this.groupName, this.myNumber);
}

class _TeacherChatPageState extends State<TeacherChatPage> {

  _TeacherChatPageState(this.groupId, this.groupName, this.myNumber);

  String myNumber;
  String groupId;
  String groupName;

  Widget page;

  Widget allPage;

  @override
  void initState() {
    page = new Center(
      child: Icon(Icons.list, color: Colors.lightBlueAccent, size: 64,),
    );
  }

  @override
  Widget build(BuildContext context) {
    createChatPage();
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
        centerTitle: true,
      ),
      body: new Column(
          children: <Widget>[
            new Flexible(
                child:page
            ),
            new Divider(height: 1.0),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor,),
              child: _buildTextComposer(),
            )
          ]
      ),
    );
  }

  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted() {
    // print('123:' + _textController.text.length.toString());
    if (_textController.text.length != 0) {
      Chatting chatting = new Chatting(2.toString(), groupId, myNumber, _textController.text);
      if (chatting.key == false) {
        showDialog<Null>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('发送信息'),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text('发送失败'),
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
      } else {
        _textController.clear();
      }
      Future.delayed(Duration(seconds: 2), (){
        createChatPage();
        print('延时2s执行');
      });
    }

  }

  Widget _buildTextComposer() {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
            children: <Widget> [
              new Flexible(
                  child: new TextField(
                    controller: _textController,
                    // onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration.collapsed(hintText: '发送消息'),
                  )
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () {
                      _handleSubmitted();
                    }
                ),
              )
            ]
        )
    );
  }

  void createChatPage() {
    print('。。。。。。。');
    page = ChatList(groupId, myNumber);
    setState(() {
      page;
    });
  }
}
