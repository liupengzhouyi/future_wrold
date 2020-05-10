class ReturnObject {
  int id;
  int authorid;
  String title;
  String lpcontent;
  int lpyear;
  int lpmonth;
  int lpday;

  ReturnObject(
      {this.id,
        this.authorid,
        this.title,
        this.lpcontent,
        this.lpyear,
        this.lpmonth,
        this.lpday});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorid = json['authorid'];
    title = json['title'];
    lpcontent = json['lpcontent'];
    lpyear = json['lpyear'];
    lpmonth = json['lpmonth'];
    lpday = json['lpday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorid'] = this.authorid;
    data['title'] = this.title;
    data['lpcontent'] = this.lpcontent;
    data['lpyear'] = this.lpyear;
    data['lpmonth'] = this.lpmonth;
    data['lpday'] = this.lpday;
    return data;
  }
}