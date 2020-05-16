class ReturnObject {
  int id;
  int titleid;
  String teachernumber;
  String studentnumber;
  String name;
  String introduction;
  String fileurl;
  String upladdata;
  int versionkey;
  String version;
  Null approvaldata;
  Null approval;

  ReturnObject(
      {this.id,
        this.titleid,
        this.teachernumber,
        this.studentnumber,
        this.name,
        this.introduction,
        this.fileurl,
        this.upladdata,
        this.versionkey,
        this.version,
        this.approvaldata,
        this.approval});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleid = json['titleid'];
    teachernumber = json['teachernumber'];
    studentnumber = json['studentnumber'];
    name = json['name'];
    introduction = json['introduction'];
    fileurl = json['fileurl'];
    upladdata = json['upladdata'];
    versionkey = json['versionkey'];
    version = json['version'];
    approvaldata = json['approvaldata'];
    approval = json['approval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titleid'] = this.titleid;
    data['teachernumber'] = this.teachernumber;
    data['studentnumber'] = this.studentnumber;
    data['name'] = this.name;
    data['introduction'] = this.introduction;
    data['fileurl'] = this.fileurl;
    data['upladdata'] = this.upladdata;
    data['versionkey'] = this.versionkey;
    data['version'] = this.version;
    data['approvaldata'] = this.approvaldata;
    data['approval'] = this.approval;
    return data;
  }
}