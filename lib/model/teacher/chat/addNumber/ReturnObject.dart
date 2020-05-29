class ReturnObject {
  int id;
  int groupid;
  int studentid;

  ReturnObject({this.id, this.groupid, this.studentid});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupid = json['groupid'];
    studentid = json['studentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupid'] = this.groupid;
    data['studentid'] = this.studentid;
    return data;
  }
}