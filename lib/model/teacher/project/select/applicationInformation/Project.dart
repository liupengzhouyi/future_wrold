class Project {
  int id;
  int teacherid;
  String title;
  String fileurl;
  int isselect;
  String studentnumber;

  Project(
      {this.id,
        this.teacherid,
        this.title,
        this.fileurl,
        this.isselect,
        this.studentnumber});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherid = json['teacherid'];
    title = json['title'];
    fileurl = json['fileurl'];
    isselect = json['isselect'];
    studentnumber = json['studentnumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacherid'] = this.teacherid;
    data['title'] = this.title;
    data['fileurl'] = this.fileurl;
    data['isselect'] = this.isselect;
    data['studentnumber'] = this.studentnumber;
    return data;
  }
}