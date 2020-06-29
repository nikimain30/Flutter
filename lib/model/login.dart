class Login {
  String email;
  String pwd;
  Login(this.email, this.pwd);

  Login.map(dynamic obj) {
    this.email = obj["email"];
    this.pwd = obj["password"];
  }

  String get username => email;
  String get password => pwd;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = pwd;

    return map;
  }
}