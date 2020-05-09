class Student {
  int id;
  String imageurl;
  int isdelete;
  String name;
  int password;
  String phonenumber;
  int prodessionalid;
  String studentid;

  Student(
      {this.id,
        this.imageurl,
        this.isdelete,
        this.name,
        this.password,
        this.phonenumber,
        this.prodessionalid,
        this.studentid});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageurl = json['imageurl'];
    isdelete = json['isdelete'];
    name = json['name'];
    password = json['password'];
    phonenumber = json['phonenumber'];
    prodessionalid = json['prodessionalid'];
    studentid = json['studentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageurl'] = this.imageurl;
    data['isdelete'] = this.isdelete;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phonenumber'] = this.phonenumber;
    data['prodessionalid'] = this.prodessionalid;
    data['studentid'] = this.studentid;
    return data;
  }

  @override
  String toString() {
    return '{"id": $id, "imageurl": "$imageurl", "isdelete": $isdelete, "name": "$name", "password": $password, "phonenumber": $phonenumber, "prodessionalid": $prodessionalid, "studentid": $studentid}';
  }


}