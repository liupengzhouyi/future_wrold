import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/chat/addNumber/AddGroupNumber.dart';
import 'package:futurewrold/model/teacher/chat/addNumber/ReturnAddGroupNumber.dart';
import 'package:futurewrold/model/teacher/chat/chatting/SendChat.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/ReturnObject.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/ReturnTeacherGetChat.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/TeacherGetChat.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/teacher/chat/chatting/Chatting.dart';
import 'package:futurewrold/view/teacher/chat/getChatInformation/ChatList.dart';
import 'package:futurewrold/view/teacher/chat/getChatInformation/ChatListView.dart';

class TeacherChatPage extends StatefulWidget {

  TeacherChatPage(this.groupId, this.groupName, this.myNumber , {Key key}) : super(key : key);

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
  TextEditingController unameController = new TextEditingController();
  Widget page;
  Widget itemInAddNumber;
  Widget allPage;

  void CreateAll() {
    itemInAddNumber = TextFormField(
      autofocus: false,
      // keyboardType: TextInputType.number,
      //键盘回车键的样式
      textInputAction: TextInputAction.next,
      controller: unameController,
    );
    allPage = Scaffold(
      appBar: AppBar(
        title: Text(groupName),
        centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: () {
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: new Text('添加群组成员'),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          new Text('新成员编号'),
                          itemInAddNumber,
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('取消'),
                        onPressed: () {
                          // applicationPaperFunction();
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text('确定'),
                        onPressed: () async {
                          AddGroupNumber temtAddGroupNumber = new AddGroupNumber();
                          temtAddGroupNumber.studentid = int.parse(unameController.text);
                          temtAddGroupNumber.groupid = int.parse(groupId);
                          temtAddGroupNumber.id = 0;
                          unameController.clear();
                          var result = await HttpUtils.request(
                            '/groupnumber/add',
                            method: HttpUtils.POST,
                            data: temtAddGroupNumber.toJson(),
                          );
                          ReturnAddGroupNumber returnAddGroupNumber = ReturnAddGroupNumber.fromJson(result);
                          if (returnAddGroupNumber.returnKey == true) {
                            itemInAddNumber = Text('添加成功', style: TextStyle(color: Colors.green, fontSize: 32),);
                            setState(() {
                              itemInAddNumber;
                            });
                          } else {
                            itemInAddNumber = Text('添加失败', style: TextStyle(color: Colors.red, fontSize: 32),);
                            setState(() {
                              itemInAddNumber;
                            });
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ).then((val) {
                print(val);
              });
            }),
          ],
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
                                  Chatting chatting = new Chatting(2.toString(), groupId, myNumber, _textController.text);
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
