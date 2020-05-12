class GetTeacherByCollege {
  String college;
  String department;
  int id;
  String number;
  String professional;

  GetTeacherByCollege(
      {this.college, this.department, this.id, this.number, this.professional});

  GetTeacherByCollege.fromJson(Map<String, dynamic> json) {
    college = json['college'];
    department = json['department'];
    id = json['id'];
    number = json['number'];
    professional = json['professional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['college'] = this.college;
    data['department'] = this.department;
    data['id'] = this.id;
    data['number'] = this.number;
    data['professional'] = this.professional;
    return data;
  }
}