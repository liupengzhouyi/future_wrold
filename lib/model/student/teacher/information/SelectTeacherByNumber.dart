class SelectTeacherByNumber {
  int id;
  String imageurl;
  int isdelete;
  String name;
  int password;
  String phonenumber;
  String professionalid;
  String teachernumber;

  SelectTeacherByNumber(
      {this.id,
        this.imageurl,
        this.isdelete,
        this.name,
        this.password,
        this.phonenumber,
        this.professionalid,
        this.teachernumber});

  SelectTeacherByNumber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageurl = json['imageurl'];
    isdelete = json['isdelete'];
    name = json['name'];
    password = json['password'];
    phonenumber = json['phonenumber'];
    professionalid = json['professionalid'];
    teachernumber = json['teachernumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageurl'] = this.imageurl;
    data['isdelete'] = this.isdelete;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phonenumber'] = this.phonenumber;
    data['professionalid'] = this.professionalid;
    data['teachernumber'] = this.teachernumber;
    return data;
  }
}