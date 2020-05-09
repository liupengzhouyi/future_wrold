import 'package:futurewrold/model/master/registered/Conservator.dart';

class MasterRegistered {
  Conservator conservator;
  String password;
  String password1;
  String password2;

  MasterRegistered(
      {this.conservator, this.password, this.password1, this.password2});

  MasterRegistered.fromJson(Map<String, dynamic> json) {
    conservator = json['conservator'] != null
        ? new Conservator.fromJson(json['conservator'])
        : null;
    password = json['password'];
    password1 = json['password1'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conservator != null) {
      data['conservator'] = this.conservator.toJson();
    }
    data['password'] = this.password;
    data['password1'] = this.password1;
    data['password2'] = this.password2;
    return data;
  }
}