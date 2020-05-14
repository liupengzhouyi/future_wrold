class ApplicationPaper {
  String applicationdata;
  int id;
  int pass;
  String passdata;
  int studentid;
  int titleid;

  ApplicationPaper(
      {this.applicationdata,
        this.id,
        this.pass,
        this.passdata,
        this.studentid,
        this.titleid});

  ApplicationPaper.fromJson(Map<String, dynamic> json) {
    applicationdata = json['applicationdata'];
    id = json['id'];
    pass = json['pass'];
    passdata = json['passdata'];
    studentid = json['studentid'];
    titleid = json['titleid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicationdata'] = this.applicationdata;
    data['id'] = this.id;
    data['pass'] = this.pass;
    data['passdata'] = this.passdata;
    data['studentid'] = this.studentid;
    data['titleid'] = this.titleid;
    return data;
  }
}