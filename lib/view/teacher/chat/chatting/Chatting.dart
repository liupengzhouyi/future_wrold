import 'package:futurewrold/model/teacher/chat/chatting/Chat.dart';
import 'package:futurewrold/model/teacher/chat/chatting/SendChat.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class Chatting {

  String groupId;

  String type;

  String userNumber;

  String information;

  Chat chat;

  bool key;

  Chatting(this.type, this.groupId, this.userNumber, this.information) {
    chat = new Chat();
    chat.type = int.parse(type);
    chat.information = information;
    chat.authorid = int.parse(userNumber);
    chat.groupid = int.parse(groupId);
  }


  Future<void> send() async {
    var result = await HttpUtils.request(
      '/chat/add',
      method: HttpUtils.POST,
      data: chat.toJson(),
    );
    SendChat sendChat = SendChat.fromJson(result);
    return sendChat.returnKey.toString();
  }

}