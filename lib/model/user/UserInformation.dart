class UserInformation {
  int landing;
  int userType;
  int professionalId;
  String userName;
  String userNumber;
  String password;
  String imageurl;
  String phoneNumber;

  UserInformation(
      {this.landing,
        this.userType,
        this.professionalId,
        this.userName,
        this.userNumber,
        this.password,
        this.imageurl,
        this.phoneNumber
      });

  UserInformation.fromJson(Map<String, dynamic> json) {
    landing = json['landing'];
    userType = json['userType'];
    professionalId = json['professionalId'];
    userName = json['userName'];
    userNumber = json['userNumber'];
    password = json['password'];
    imageurl = json['imageurl'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['landing'] = this.landing;
    data['userType'] = this.userType;
    data['professionalId'] = this.professionalId;
    data['userName'] = this.userName;
    data['userNumber'] = this.userNumber;
    data['password'] = this.password;
    data['imageurl'] = this.imageurl;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }

  @override
  String toString() {
    return '{"landing": $landing, "userType": $userType, "professionalId": $professionalId, "userName": "$userName", "userNumber": "$userNumber", "password": "$password", "imageurl": "$imageurl", "phoneNumber": "$phoneNumber"}';
  }


}