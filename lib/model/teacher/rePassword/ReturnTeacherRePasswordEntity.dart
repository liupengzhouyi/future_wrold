class ReturnTeacherRePasswordEntity {
  String what;
  bool returnKey;
  Null returnObject;
  String why;

  ReturnTeacherRePasswordEntity(
      {this.what, this.returnKey, this.returnObject, this.why});

  ReturnTeacherRePasswordEntity.fromJson(Map<String, dynamic> json) {
    what = json['what'];
    returnKey = json['returnKey'];
    returnObject = json['returnObject'];
    why = json['why'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['what'] = this.what;
    data['returnKey'] = this.returnKey;
    data['returnObject'] = this.returnObject;
    data['why'] = this.why;
    return data;
  }
}