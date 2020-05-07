import 'package:futurewrold/model/student/landing/ReturnObject.dart';

class ReturnStudentLanding {
  String what;
  bool returnKey;
  ReturnObject returnObject;
  String why;

  ReturnStudentLanding(
      {this.what, this.returnKey, this.returnObject, this.why});

  ReturnStudentLanding.fromJson(Map<String, dynamic> json) {
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
    return 'ReturnStudentLanding{what: $what, returnKey: $returnKey, returnObject: $returnObject, why: $why}';
  }


}