class ForgotPassword {
  String message;
  String userMsg;
  ForgotPassword(this.message);

  ForgotPassword.map(dynamic obj) {
    this.message = obj["message"];
    this.userMsg = obj["user_msg"];
  }

  String get msg => message;
  String get usrMsg => userMsg;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["message"] = message;
    map["user_msg"] = userMsg;

    return map;
  }
}