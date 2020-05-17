class TeacherGetChat {
  int authorid;
  int day;
  int groupid;
  int hour;
  int id;
  String information;
  int moment;
  int month;
  int second;
  int type;
  int year;

  TeacherGetChat(
      {this.authorid,
        this.day,
        this.groupid,
        this.hour,
        this.id,
        this.information,
        this.moment,
        this.month,
        this.second,
        this.type,
        this.year});

  TeacherGetChat.fromJson(Map<String, dynamic> json) {
    authorid = json['authorid'];
    day = json['day'];
    groupid = json['groupid'];
    hour = json['hour'];
    id = json['id'];
    information = json['information'];
    moment = json['moment'];
    month = json['month'];
    second = json['second'];
    type = json['type'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorid'] = this.authorid;
    data['day'] = this.day;
    data['groupid'] = this.groupid;
    data['hour'] = this.hour;
    data['id'] = this.id;
    data['information'] = this.information;
    data['moment'] = this.moment;
    data['month'] = this.month;
    data['second'] = this.second;
    data['type'] = this.type;
    data['year'] = this.year;
    return data;
  }
}