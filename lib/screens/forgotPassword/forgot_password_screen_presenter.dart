import 'package:neostore/data/rest_ds.dart';
import 'package:neostore/model/forgot_password.dart';

abstract class ForgotPasswordScreenContract {
  void onForgotPwdSuccess(ForgotPassword forgotPassword);
  void onForgotPwdError(String errorTxt);
}

class ForgotPasswordScreenPresenter  {
  ForgotPasswordScreenContract contractForgotPwd;
  RestDatasource api = new RestDatasource();
  ForgotPasswordScreenPresenter(this.contractForgotPwd);

  setPassword(String email) {
    api.forgotPassword(email).then((ForgotPassword forgotPassword) {
      contractForgotPwd.onForgotPwdSuccess(forgotPassword);
    }).catchError((Exception error) {
      contractForgotPwd.onForgotPwdError(error.toString());
    });
  }

}