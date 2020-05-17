import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/ReturnObject.dart';



class ChatCard extends StatefulWidget {

  ChatCard(this.myNumber, this.returnObject);

  String myNumber;

  ReturnObject returnObject;

  @override
  _ChatCardState createState() => _ChatCardState(this.myNumber, this.returnObject);
}

class _ChatCardState extends State<ChatCard> {



  String myNumber;

  ReturnObject returnObject;

  Widget page;


  @override
  void initState() {
    page = ListTile(
      leading: CircleAvatar(
        // backgroundImage: NetworkImage(returnObject.imageurl),
      ),
      title: new Text('returnObject.name'),
      trailing: new Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
                // builder: (context) => TeacherChatPage(returnObject.id.toString(), returnObject.name, myNumber)
            )
        );

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  _ChatCardState(this.myNumber, this.returnObject);
}
