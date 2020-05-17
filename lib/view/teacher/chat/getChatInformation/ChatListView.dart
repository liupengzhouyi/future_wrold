import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/ReturnObject.dart';
import 'package:futurewrold/view/teacher/chat/getChatInformation/ChatCard.dart';

class ChatListView extends StatefulWidget {

  ChatListView(this.myNumber, this.list);

  String myNumber;

  List<ReturnObject> list;

  @override
  _ChatListViewState createState() => _ChatListViewState(this.myNumber, this.list);


}

class _ChatListViewState extends State<ChatListView> {

  _ChatListViewState(this.myNumber, this.list);

  String myNumber;

  List<ReturnObject> list;

  Widget page;


  @override
  void initState() {
    createListView();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  void createListView() {
    List<Widget> chatList = new List();
    for (ReturnObject item in list) {
      ChatCard chatCard = new ChatCard(myNumber, item);
      chatList.add(chatCard);
    }
    page = ListView(
      children: chatList,
    );
    setState(() {
      page;
    });
  }



}
