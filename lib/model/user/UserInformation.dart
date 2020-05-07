class UserInformation {
  int _landing;
  int _userType;
  int _professionalId;
  String _userName;
  String _userNumber;
  String _password;
  String _imageurl;

  UserInformation(
      {int landing,
        int userType,
        int professionalId,
        String userName,
        String userNumber,
        String password,
        String imageurl}) {
    this._landing = landing;
    this._userType = userType;
    this._professionalId = professionalId;
    this._userName = userName;
    this._userNumber = userNumber;
    this._password = password;
    this._imageurl = imageurl;
  }

  int get landing => _landing;
  set landing(int landing) => _landing = landing;
  int get userType => _userType;
  set userType(int userType) => _userType = userType;
  int get professionalId => _professionalId;
  set professionalId(int professionalId) => _professionalId = professionalId;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get userNumber => _userNumber;
  set userNumber(String userNumber) => _userNumber = userNumber;
  String get password => _password;
  set password(String password) => _password = password;
  String get imageurl => _imageurl;
  set imageurl(String imageurl) => _imageurl = imageurl;

  UserInformation.fromJson(Map<String, dynamic> json) {
    _landing = json['landing'];
    _userType = json['userType'];
    _professionalId = json['professionalId'];
    _userName = json['userName'];
    _userNumber = json['userNumber'];
    _password = json['password'];
    _imageurl = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['landing'] = this._landing;
    data['userType'] = this._userType;
    data['professionalId'] = this._professionalId;
    data['userName'] = this._userName;
    data['userNumber'] = this._userNumber;
    data['password'] = this._password;
    data['imageurl'] = this._imageurl;
    return data;
  }

  @override
  String toString() {
    return 'UserInformation{_landing: $_landing, _userType: $_userType, _professionalId: $_professionalId, _userName: $_userName, _userNumber: $_userNumber, _password: $_password, _imageurl: $_imageurl}';
  }


}