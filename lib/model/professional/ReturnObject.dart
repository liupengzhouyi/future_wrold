class ReturnObject {
  int id;
  String number;
  String college;
  String department;
  String professional;

  ReturnObject(
      {this.id, this.number, this.college, this.department, this.professional});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    college = json['college'];
    department = json['department'];
    professional = json['professional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['college'] = this.college;
    data['department'] = this.department;
    data['professional'] = this.professional;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{id: $id, number: $number, college: $college, department: $department, professional: $professional}';
  }


}