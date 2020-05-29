class AddGroupNumber {
  int groupid;
  int id;
  int studentid;

  AddGroupNumber({this.groupid, this.id, this.studentid});

  AddGroupNumber.fromJson(Map<String, dynamic> json) {
    groupid = json['groupid'];
    id = json['id'];
    studentid = json['studentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupid'] = this.groupid;
    data['id'] = this.id;
    data['studentid'] = this.studentid;
    return data;
  }
}