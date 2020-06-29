class Register {
  String firstName, lastName, email, password, confirmPassword, gender, phoneNo;

  Register({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.gender,
    this.phoneNo,
  });

  Register.fromJson(Map<String, dynamic> map) {
    firstName = map['first_name'];
    lastName = map['last_name'];
    email = map['email'];
    password = map['password'];
    confirmPassword = map['confirm_password'];
    gender = map['gender'];
    phoneNo = map['phone_no'];
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['confirm_password'] = confirmPassword;
    map['gender'] = gender;
    map['phone_no'] = phoneNo;
    return map;
  }
}
