

import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/chat/getChatInformation/ReturnTeacherGetChat.dart';
import 'package:futurewrold/model/student/chat/getChatInformation/StudentGetChat.dart';
import 'package:futurewrold/model/student/chat/getChatInformation/ReturnObject.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/student/chat/getChatInformation/ChatListView.dart';

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
    StudentGetChat studentGetChat = new StudentGetChat();
    studentGetChat.groupid = int.parse(groupId);
    var result = await HttpUtils.request(
      '/chat/getByGroupID',
      method: HttpUtils.POST,
      data: studentGetChat.toJson(),
    );
    ReturnStudentGetChat returnStudentGetChat = ReturnStudentGetChat.fromJson(result);
    List<ReturnObject> list = new List();
    if (returnStudentGetChat.returnKey == true) {
      list = returnStudentGetChat.returnObject;
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
