

import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/ReturnObject.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/ReturnTeacherGetChat.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/TeacherGetChat.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/teacher/chat/getChatInformation/ChatListView.dart';

class ChatList extends StatefulWidget {

  String groupId;

  String myNumber;


  ChatList(this.groupId, this.myNumber);

  @override
  _ChatListState createState() => _ChatListState(this.groupId, this.myNumber);
}

class _ChatListState extends State<ChatList> {

  String groupId;

  String myNumber;

  _ChatListState(this.groupId, this.myNumber);

 Widget page;

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  Future<void> getData() async {
    TeacherGetChat teacherGetChat = new TeacherGetChat();
    teacherGetChat.groupid = int.parse(groupId);
    var result = await HttpUtils.request(
      '/chat/getByGroupID',
      method: HttpUtils.POST,
      data: teacherGetChat.toJson(),
    );
    ReturnTeacherGetChat returnTeacherGetChat = ReturnTeacherGetChat.fromJson(result);
    List<ReturnObject> list = new List();
    if (returnTeacherGetChat.returnKey == true) {
      list = returnTeacherGetChat.returnObject;
    }
    createListPage(list);
  }


  createListPage(List<ReturnObject> list) {
    page = ChatListView(myNumber, list);
    setState(() {
      page;
    });
  }
}
