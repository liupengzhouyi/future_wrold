import 'package:futurewrold/model/utils/file/image/ReturnObject.dart';

class ReturnUploadFile {
  String what;
  bool returnKey;
  ReturnObject returnObject;
  Null why;

  ReturnUploadFile({this.what, this.returnKey, this.returnObject, this.why});

  ReturnUploadFile.fromJson(Map<String, dynamic> json) {
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
    return 'ReturnUploadFile{what: $what, returnKey: $returnKey, returnObject: $returnObject, why: $why}';
  }


}
