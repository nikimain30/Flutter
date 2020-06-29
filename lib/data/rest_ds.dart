import 'dart:convert';

import 'package:http/http.dart';
import 'package:neostore/model/forgot_password.dart';
import 'package:neostore/model/login.dart';
import 'package:neostore/model/register.dart';
import 'package:neostore/model/request/register_request.dart';
import 'package:neostore/utils/network_util.dart';

class RestDatasource {
  NetworkUtil networkUtil = new NetworkUtil();
  static final BASE_URL = "http://staging.php-dev.in:8844/trainingapp/api/";
  static final LOGIN_URL = BASE_URL + "users/login";
  static final FORGOT_PASSWORD_URL = BASE_URL + "users/forgot";
  static final REGISTER_URL = BASE_URL + "users/register";

  Future<Login> login(String username, String password) {
    return networkUtil.post(LOGIN_URL, body: {
      "email": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      return new Login.map(res["login"]);
    });
  }

  Future<ForgotPassword> forgotPassword(String email) {
    return networkUtil.post(FORGOT_PASSWORD_URL, body: {
      "email": email,
    }).then((dynamic res) {
      print(res.toString());
      return new ForgotPassword.map(res["forgot_password"]);
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<RegisterResponse> register(String firstName, String lastName, String email, String password,
      String confirmPassword, String gender, String phoneNo) {

    Register response = new Register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      gender: gender,
      phoneNo: phoneNo,
    );

    return networkUtil.post(REGISTER_URL, body:response.toMap(),headers:{"Content-Type": "application/json"},
    ).then((dynamic res) {
      print(res.toString());

    }).catchError((error) {
      print(error.toString());
    });
  }


//  Future<RegisterResponse> register() async {
//    Response res = await post(REGISTER_URL,body: );
//
//    if (res.statusCode == 200) {
//      dynamic body = jsonDecode(res.body);
//
//      RegisterResponse posts = body
//          .map(
//            (dynamic item) => RegisterResponse.fromJson(item),
//      )
//          .toList();
//
//      return posts;
//    } else {
//      throw "Can't get posts.";
//    }
//  }

}
