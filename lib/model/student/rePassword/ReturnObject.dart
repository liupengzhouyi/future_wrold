class ReturnObject {
  int id;
  String studentid;
  int password;
  String imageurl;
  int prodessionalid;
  String phonenumber;
  int isdelete;
  String name;

  ReturnObject(
      {this.id,
        this.studentid,
        this.password,
        this.imageurl,
        this.prodessionalid,
        this.phonenumber,
        this.isdelete,
        this.name});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentid = json['studentid'];
    password = json['password'];
    imageurl = json['imageurl'];
    prodessionalid = json['prodessionalid'];
    phonenumber = json['phonenumber'];
    isdelete = json['isdelete'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentid'] = this.studentid;
    data['password'] = this.password;
    data['imageurl'] = this.imageurl;
    data['prodessionalid'] = this.prodessionalid;
    data['phonenumber'] = this.phonenumber;
    data['isdelete'] = this.isdelete;
    data['name'] = this.name;
    return data;
  }
}