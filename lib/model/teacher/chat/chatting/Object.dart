class ReturnObject {
  int id;
  int groupid;
  int type;
  int authorid;
  String information;
  int year;
  int month;
  int day;
  int hour;
  int moment;
  int second;

  ReturnObject(
      {this.id,
        this.groupid,
        this.type,
        this.authorid,
        this.information,
        this.year,
        this.month,
        this.day,
        this.hour,
        this.moment,
        this.second});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupid = json['groupid'];
    type = json['type'];
    authorid = json['authorid'];
    information = json['information'];
    year = json['year'];
    month = json['month'];
    day = json['day'];
    hour = json['hour'];
    moment = json['moment'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupid'] = this.groupid;
    data['type'] = this.type;
    data['authorid'] = this.authorid;
    data['information'] = this.information;
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    data['hour'] = this.hour;
    data['moment'] = this.moment;
    data['second'] = this.second;
    return data;
  }
}