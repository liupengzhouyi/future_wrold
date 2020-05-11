class TeacherAddProject {
  String fileurl;
  int id;
  int isselect;
  String studentnumber;
  int teacherid;
  String title;

  TeacherAddProject(
      {this.fileurl,
        this.id,
        this.isselect,
        this.studentnumber,
        this.teacherid,
        this.title});

  TeacherAddProject.fromJson(Map<String, dynamic> json) {
    fileurl = json['fileurl'];
    id = json['id'];
    isselect = json['isselect'];
    studentnumber = json['studentnumber'];
    teacherid = json['teacherid'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileurl'] = this.fileurl;
    data['id'] = this.id;
    data['isselect'] = this.isselect;
    data['studentnumber'] = this.studentnumber;
    data['teacherid'] = this.teacherid;
    data['title'] = this.title;
    return data;
  }
}