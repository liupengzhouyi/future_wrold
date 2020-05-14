class Teacher {
  int id;
  String imageurl;
  String teachernumber;
  int password;
  String phonenumber;
  String professionalid;
  int isdelete;
  String name;

  Teacher(
      {this.id,
        this.imageurl,
        this.teachernumber,
        this.password,
        this.phonenumber,
        this.professionalid,
        this.isdelete,
        this.name});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageurl = json['imageurl'];
    teachernumber = json['teachernumber'];
    password = json['password'];
    phonenumber = json['phonenumber'];
    professionalid = json['professionalid'];
    isdelete = json['isdelete'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageurl'] = this.imageurl;
    data['teachernumber'] = this.teachernumber;
    data['password'] = this.password;
    data['phonenumber'] = this.phonenumber;
    data['professionalid'] = this.professionalid;
    data['isdelete'] = this.isdelete;
    data['name'] = this.name;
    return data;
  }
}