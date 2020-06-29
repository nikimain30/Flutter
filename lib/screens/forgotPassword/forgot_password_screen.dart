import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/model/forgot_password.dart';

import 'forgot_password_screen_presenter.dart';

class ForgotPasswordScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ForgotPasswordState();
  }
}

class ForgotPasswordState extends State<ForgotPasswordScreen> implements ForgotPasswordScreenContract{

  BuildContext ctx;
  String email;
  bool isLoading = false;
  ForgotPasswordScreenPresenter forgotPasswordScreenPresenter;

  ForgotPasswordState(){
    forgotPasswordScreenPresenter = new ForgotPasswordScreenPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ctx = context;
    var forgotPwdBtn = new Container(
      margin: const EdgeInsets.only(top: 30.0,bottom: 22.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(onPressed: null,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
              side: BorderSide(color: Colors.white)),
          color: Colors.white,
          textColor: Colors.red[700],
          disabledColor: Colors.white,
          padding: new EdgeInsets.all(8.0),
          child: new Text("Forgot Password",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gotham',
              color: Colors.red[700],
            ),
          ),
        ),
      ),
    );

    var forgotPasswordForm = new Column(
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(bottom: 49.0),
          child: new Text(
            "NeoSTORE",
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        new Form(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(
                    decoration: InputDecoration(labelText: "email",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),gapPadding: 4.0,
                      ),
                    ),
                    onSaved: (val) => email = val,
                    validator: (val) {
                      return val.length < 10
                          ? "Username must have atleast 10 chars" : null;
                    },
                  ),
                ),
              ],
            )
        ),
        isLoading ? new CircularProgressIndicator() : forgotPwdBtn,

      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );



    return new Scaffold(
      appBar: new AppBar(title: new Text("Forgot Password"),),
      body:
      new Container(
        decoration: new BoxDecoration(
            color: Colors.red[700]
        ),
        child: new Center(
          child: new ClipRect(
              child: new Container(
                child: forgotPasswordForm,
                height: double.infinity,
                width: 350.0,
              ),
          ),
        ),
      ),
//          Align(
//            alignment: Alignment.bottomLeft,
//            child: floatingbtn,
//          )
    );
  }

  @override
  void onForgotPwdError(String errorTxt) {
    // TODO: implement onForgotPwdError
  }

  @override
  void onForgotPwdSuccess(ForgotPassword forgotPassword) {
    // TODO: implement onForgotPwdSuccess
  }


}

