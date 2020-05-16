class ReturnMasterAddSystemAD {
  String what;
  bool returnKey;
  int returnObject;
  String why;

  ReturnMasterAddSystemAD(
      {this.what, this.returnKey, this.returnObject, this.why});

  ReturnMasterAddSystemAD.fromJson(Map<String, dynamic> json) {
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