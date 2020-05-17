class ReturnObject {
  int id;
  int teacherid;
  String imageurl;
  String name;

  ReturnObject({this.id, this.teacherid, this.imageurl, this.name});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherid = json['teacherid'];
    imageurl = json['imageurl'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacherid'] = this.teacherid;
    data['imageurl'] = this.imageurl;
    data['name'] = this.name;
    return data;
  }
}