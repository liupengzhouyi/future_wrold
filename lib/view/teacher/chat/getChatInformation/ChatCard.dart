import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/Chat.dart';
import 'package:futurewrold/model/teacher/chat/getChatInformation/Object.dart';
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
    Object object = Object.fromJson(returnObject.object.toJson());
    Chat chat = Chat.fromJson(returnObject.chat.toJson());
    String imageURL = object.imageurl.toString();
    String data = chat.year.toString() + '-' + chat.month.toString() + '-' + chat.day.toString() + " "
    + chat.hour.toString() + ':' + chat.moment.toString() + ':' + chat.second.toString();
    if(chat.authorid.toString() == myNumber){
      page = new Column(
        children: <Widget>[
          new Center(child: Text(data),),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new SizedBox(width: 60,),
              Flexible(
                child: Card(
                  color: Colors.yellow,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Text(object.name),
                        new Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: new Text(chat.information,
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                            textDirection: TextDirection.ltr,
                            softWrap: true,
                          ),
                        )
                      ]
                  ),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 12.0,right: 12.0),
                child: new CircleAvatar(
                  backgroundImage: AssetImage('$imageURL'),
                  radius: 24.0,
                ) ,
              ),
            ],
          ),
        ],
      );
    }
    else{
      page = new Column(
        children: <Widget>[
          new Center(child: Text(data),),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 12.0,right: 12.0),
                child: new CircleAvatar(
                  backgroundImage: NetworkImage('$imageURL'),
                  radius: 24.0,
                ) ,
              ),
              Flexible(
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(object.name),
                        new Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: new Text(chat.information,
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                            textDirection: TextDirection.ltr,
                            softWrap: true,
                          ),
                        ),
                      ]
                  ),
                ),
              ),
              new SizedBox(width: 60,),
            ],
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }

  _ChatCardState(this.myNumber, this.returnObject);
}
