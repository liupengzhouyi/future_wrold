import 'package:futurewrold/model/student/registered/ReturnObject.dart';

class ReturnStudentRegistered {
  String what;
  bool returnKey;
  ReturnObject returnObject;
  String why;

  ReturnStudentRegistered(
      {this.what, this.returnKey, this.returnObject, this.why});

  ReturnStudentRegistered.fromJson(Map<String, dynamic> json) {
    what = json['what'];
    returnKey = json['returnKey'];
    returnObject = json['returnObject'] != null
        ? new ReturnObject.fromJson(json['returnObject'])
        : null;
    why = json['why'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['what'] = this.what;
    data['returnKey'] = this.returnKey;
    if (this.returnObject != null) {
      data['returnObject'] = this.returnObject.toJson();
    }
    data['why'] = this.why;
    return data;
  }

  @override
  String toString() {
    return 'ReturnStudentRegistered{what: $what, returnKey: $returnKey, returnObject: $returnObject, why: $why}';
  }


}