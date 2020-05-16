class MasterAddSystemAD {
  int authorid;
  int id;
  String lpcontent;
  int lpday;
  int lpmonth;
  int lpyear;
  String title;

  MasterAddSystemAD(
      {this.authorid,
        this.id,
        this.lpcontent,
        this.lpday,
        this.lpmonth,
        this.lpyear,
        this.title});

  MasterAddSystemAD.fromJson(Map<String, dynamic> json) {
    authorid = json['authorid'];
    id = json['id'];
    lpcontent = json['lpcontent'];
    lpday = json['lpday'];
    lpmonth = json['lpmonth'];
    lpyear = json['lpyear'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorid'] = this.authorid;
    data['id'] = this.id;
    data['lpcontent'] = this.lpcontent;
    data['lpday'] = this.lpday;
    data['lpmonth'] = this.lpmonth;
    data['lpyear'] = this.lpyear;
    data['title'] = this.title;
    return data;
  }
}