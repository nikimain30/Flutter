import 'package:flutter/cupertino.dart';
import 'package:neostore/screens/forgotPassword/forgot_password_screen.dart';
import 'package:neostore/screens/login/login_screen.dart';
import 'package:neostore/screens/register/register_screen.dart';

final routes = {
  '/' : (BuildContext context) => new LoginScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
  '/forgotPassword': (BuildContext context) => new ForgotPasswordScreen(),
  '/register': (BuildContext context) => new RegisterScreen(),
};