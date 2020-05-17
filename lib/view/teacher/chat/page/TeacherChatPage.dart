import 'package:flutter/material.dart';
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

  @override
  void initState() {
    page = new Center(
      child: Icon(Icons.list, color: Colors.lightBlueAccent, size: 64,),
    );
    createChatPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评论"),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(groupName),),
      body: Column(
          children: <Widget>[
            new Flexible(
              child:page,
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

  void _handleSubmitted(String text) {
    _textController.clear();
  }

  Widget _buildTextComposer() {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
            children: <Widget> [
              new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration.collapsed(hintText: '发送消息'),
                  )
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text)),
              )
            ]
        )
    );
  }

  void createChatPage() {
    page = ChatList(groupId, myNumber);
    setState(() {
      page;
    });
  }
}
