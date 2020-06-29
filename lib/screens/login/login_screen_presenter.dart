import 'package:neostore/data/rest_ds.dart';
import 'package:neostore/model/login.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(Login login);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter  {
  LoginScreenContract contractLogin;
  RestDatasource api = new RestDatasource();
  LoginScreenPresenter(this.contractLogin);

  getLogin(String userName, String password) {
    api.login(userName, password).then((Login login) {
      contractLogin.onLoginSuccess(login);
    }).catchError((Exception error) {
      contractLogin.onLoginError(error.toString());
    });
  }

}