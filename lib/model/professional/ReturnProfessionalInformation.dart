
import 'package:futurewrold/model/professional/ReturnObject.dart';

class ReturnProfessionalInformation {
  String what;
  bool returnKey;
  List<ReturnObject> returnObject;
  String why;

  ReturnProfessionalInformation(
      {this.what, this.returnKey, this.returnObject, this.why});

  ReturnProfessionalInformation.fromJson(Map<String, dynamic> json) {
    what = json['what'];
    returnKey = json['returnKey'];
    if (json['returnObject'] != null) {
      returnObject = new List<ReturnObject>();
      json['returnObject'].forEach((v) {
        returnObject.add(new ReturnObject.fromJson(v));
      });
    }
    why = json['why'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['what'] = this.what;
    data['returnKey'] = this.returnKey;
    if (this.returnObject != null) {
      data['returnObject'] = this.returnObject.map((v) => v.toJson()).toList();
    }
    data['why'] = this.why;
    return data;
  }

  @override
  String toString() {
    return 'ReturnProfessionalInformation{what: $what, returnKey: $returnKey, returnObject: $returnObject, why: $why}';
  }


}

