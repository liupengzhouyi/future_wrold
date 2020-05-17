class TeacherGetGroupInformation {
  int id;
  String imageurl;
  String name;
  int teacherid;

  TeacherGetGroupInformation(
      {this.id, this.imageurl, this.name, this.teacherid});

  TeacherGetGroupInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageurl = json['imageurl'];
    name = json['name'];
    teacherid = json['teacherid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageurl'] = this.imageurl;
    data['name'] = this.name;
    data['teacherid'] = this.teacherid;
    return data;
  }
}