import 'package:neostore/data/rest_ds.dart';
import 'package:neostore/model/register.dart';
import 'package:neostore/model/request/register_request.dart';

abstract class RegisterScreenContract {
  void onRegisterSuccess(RegisterResponse register);
  void onRegisterError(String errorTxt);
}

class RegisterScreenPresenter {
  RegisterScreenContract contract;
  RestDatasource api = new RestDatasource();

  RegisterScreenPresenter(this.contract);

  getRegister(String firstName, String lastName, String email, String password,
      String confirmPassword, String gender, String phoneNo) {
    api.register(
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        gender,
        phoneNo).then((RegisterResponse register) {
      contract.onRegisterSuccess(register);
    }).catchError((error) {
      contract.onRegisterError(error.toString());
    });
  }
}