import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/chat/chatting/SendChat.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/student/chat/chatting/Chatting.dart';
import 'package:futurewrold/view/student/chat/getChatInformation/ChatList.dart';

class StudentChatPage extends StatefulWidget {

  StudentChatPage(this.groupId, this.groupName, this.myNumber , {Key key}) : super(key : key);

  String myNumber;
  String groupId;
  String groupName;

  @override
  _StudentChatPageState createState() => _StudentChatPageState(this.groupId, this.groupName, this.myNumber);
}

class _StudentChatPageState extends State<StudentChatPage> {

  _StudentChatPageState(this.groupId, this.groupName, this.myNumber);

  String myNumber;
  String groupId;
  String groupName;

  Widget page;

  Widget allPage;

  void CreateAll() {
    allPage = Scaffold(
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
                color: Theme.of(context).cardColor,
              ),
              child: Container(
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
                              onPressed: () async {
                                // _handleSubmitted();
                                if (_textController.text.length != 0) {
                                  Chatting chatting = new Chatting(3.toString(), groupId, myNumber, _textController.text);
                                  // String ll = chatting.send() as String;
                                  var result = await HttpUtils.request(
                                    '/chat/add',
                                    method: HttpUtils.POST,
                                    data: chatting.chat.toJson(),
                                  );
                                  SendChat sendChat = SendChat.fromJson(result);
                                  if (sendChat.returnKey != true) {
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
                                    createChatPage();
                                    _textController.clear();
                                  }
                                }
                              }
                          ),
                        )
                      ]
                  )
              ),
            )
          ]
      ),
    );
    setState(() {
      allPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    createChatPage();
    CreateAll();
    return allPage;
  }

  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted() {
    if (_textController.text.length != 0) {
      Chatting chatting = new Chatting(3.toString(), groupId, myNumber, _textController.text);
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
        createChatPage();
      }
    }
  }

  void createChatPage() {
    page = new ChatList(groupId, myNumber);
    setState(() {
      page;
    });
  }
}
