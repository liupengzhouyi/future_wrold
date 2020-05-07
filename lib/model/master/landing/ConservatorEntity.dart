

class Conservator {
  int id;
  String imageurl;
  String name;
  int password;
  String phonenumber;

  Conservator(
      {this.id, this.imageurl, this.name, this.password, this.phonenumber});

  Conservator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageurl = json['imageurl'];
    name = json['name'];
    password = json['password'];
    phonenumber = json['phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageurl'] = this.imageurl;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phonenumber'] = this.phonenumber;
    return data;
  }

  @override
  String toString() {
    return 'Conservator{id: $id, imageurl: $imageurl, name: $name, password: $password, phonenumber: $phonenumber}';
  }


}