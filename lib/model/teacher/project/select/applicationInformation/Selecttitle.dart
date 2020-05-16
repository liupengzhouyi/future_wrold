class Selecttitle {
  int id;
  int studentid;
  int titleid;
  String applicationdata;
  String passdata;
  int pass;

  Selecttitle(
      {this.id,
        this.studentid,
        this.titleid,
        this.applicationdata,
        this.passdata,
        this.pass});

  Selecttitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentid = json['studentid'];
    titleid = json['titleid'];
    applicationdata = json['applicationdata'];
    passdata = json['passdata'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentid'] = this.studentid;
    data['titleid'] = this.titleid;
    data['applicationdata'] = this.applicationdata;
    data['passdata'] = this.passdata;
    data['pass'] = this.pass;
    return data;
  }
}