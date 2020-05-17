import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container();
  }


  void getData() {

  }
}
