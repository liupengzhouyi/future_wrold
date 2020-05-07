import 'package:futurewrold/model/master/landing/ConservatorEntity.dart';

class ConservatorLanding {
  Conservator conservator;
  String password;
  String password1;
  String password2;

  ConservatorLanding(
      {this.conservator, this.password, this.password1, this.password2});

  ConservatorLanding.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'ConservatorLanding{conservator: $conservator, password: $password, password1: $password1, password2: $password2}';
  }


}