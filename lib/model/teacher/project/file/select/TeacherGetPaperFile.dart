class TeacherGetPaperFile {
  String approval;
  String approvaldata;
  String fileurl;
  int id;
  String introduction;
  String name;
  String studentnumber;
  String teachernumber;
  int titleid;
  String upladdata;
  String version;
  int versionkey;

  TeacherGetPaperFile(
      {this.approval,
        this.approvaldata,
        this.fileurl,
        this.id,
        this.introduction,
        this.name,
        this.studentnumber,
        this.teachernumber,
        this.titleid,
        this.upladdata,
        this.version,
        this.versionkey});

  TeacherGetPaperFile.fromJson(Map<String, dynamic> json) {
    approval = json['approval'];
    approvaldata = json['approvaldata'];
    fileurl = json['fileurl'];
    id = json['id'];
    introduction = json['introduction'];
    name = json['name'];
    studentnumber = json['studentnumber'];
    teachernumber = json['teachernumber'];
    titleid = json['titleid'];
    upladdata = json['upladdata'];
    version = json['version'];
    versionkey = json['versionkey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approval'] = this.approval;
    data['approvaldata'] = this.approvaldata;
    data['fileurl'] = this.fileurl;
    data['id'] = this.id;
    data['introduction'] = this.introduction;
    data['name'] = this.name;
    data['studentnumber'] = this.studentnumber;
    data['teachernumber'] = this.teachernumber;
    data['titleid'] = this.titleid;
    data['upladdata'] = this.upladdata;
    data['version'] = this.version;
    data['versionkey'] = this.versionkey;
    return data;
  }
}