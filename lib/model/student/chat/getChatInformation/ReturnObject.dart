

import 'package:futurewrold/model/student/chat/getChatInformation/Chat.dart';
import 'package:futurewrold/model/student/chat/getChatInformation/Object.dart';


class ReturnObject {
  int autorchType;
  Object object;
  Chat chat;

  ReturnObject({this.autorchType, this.object, this.chat});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    autorchType = json['autorchType'];
    object =
    json['object'] != null ? new Object.fromJson(json['object']) : null;
    chat = json['chat'] != null ? new Chat.fromJson(json['chat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autorchType'] = this.autorchType;
    if (this.object != null) {
      data['object'] = this.object.toJson();
    }
    if (this.chat != null) {
      data['chat'] = this.chat.toJson();
    }
    return data;
  }
}

