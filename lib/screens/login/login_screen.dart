import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neostore/model/login.dart';

import 'login_screen_presenter.dart';

class LoginScreen extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new LoginScreenState();
    }
}

class LoginScreenState  extends State<LoginScreen> implements LoginScreenContract{

  BuildContext ctx;
  String username,password;
  bool isLoading = false;
  LoginScreenPresenter loginScreenPresenter;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  
  
  LoginScreenState(){
    loginScreenPresenter = new LoginScreenPresenter(this);
  }

  void btnLogin() {
    final form =  formKey.currentState;
    if (form.validate()){
      setState(() {
        isLoading = true;
      });
      form.save();
      loginScreenPresenter.getLogin(username, password);

    }
  }


  void forgotPassword() {
    Navigator.of(context).pushNamed("/forgotPassword");
  }

  void btnRegister() {
     Navigator.of(context).pushNamed("/register");
  }


  @override
  Widget build(BuildContext context) {
    ctx = context;
    var loginBtn = new Container(
      margin: const EdgeInsets.only(top: 30.0,bottom: 22.0),
      child: SizedBox(
      width: double.infinity,
     child: RaisedButton(onPressed: btnLogin,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(7.0),
           side: BorderSide(color: Colors.white)),
      color: Colors.white,
      textColor: Color(0xffe91c1a),
      disabledColor: Colors.white,
      padding: new EdgeInsets.all(8.0),
      child: new Text("LOGIN",
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gotham',
            color: Color(0xffe91c1a),
        ),
      ),
    ),
    ),
    );

    var floatingbtn = new Row(
      children: <Widget>[
        new Container(child:
        new FlatButton(onPressed: btnRegister, child: Text(
          "DONT HAVE AN ACCOUNT?",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white
          ),
        ),
        ),
        ),
        new Padding(padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            onPressed: null,
            child: Icon(Icons.add,
                size: 46.0,
                color: Colors.white),
            color: Color(0xffe91c1a),
          ),
        ),
      ],
    );

    var loginForm = SingleChildScrollView(child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(top: 49.0,bottom: 49.0),
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
              key: formKey,
              child: new Column(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.all(8.0),
              child: new TextFormField(
                decoration: InputDecoration(labelText: "Username",
                    errorStyle: TextStyle(
                      color: Colors.white,
                      wordSpacing: 1.0,
                    ),
                  labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                  ) ,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),gapPadding: 4.0,
                  ),
                    prefixIcon: Icon(
                      Icons.face,
                      color: Color(0xffffffff),
                      size: 16.0,
                    )
                ),
                onSaved: (val) => username = val,
                validator: (val) {
                  return !val.contains('@') ? 'Not a valid email.' : null;
                },
              ),
              ),
              new Padding(padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => password = val,
                  validator: (val) {
                    return val.length < 8
                        ? "Paswword must have atleast 8 chars" : null;
                  },
                  decoration: new InputDecoration(labelText: "Password",
                      errorStyle: TextStyle(
                        color: Colors.white,
                        wordSpacing: 1.0,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                      border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),gapPadding: 4.0,
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xffffffff),
                        size: 16.0,
                      )
                  ),
                ),
              )
            ],
          )
          ),
          isLoading ? new CircularProgressIndicator() : loginBtn,

          new FlatButton(onPressed: forgotPassword, child:
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
              ),
            ),
          ),
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
              child: floatingbtn)
        ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
     ),
    );



    return new Scaffold(
      appBar: null,
      key: scaffoldKey,
      body:
          new Container(
            decoration: new BoxDecoration(
                color: Color(0xffe91c1a)
            ),
            child: new Center(
              child: new ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(),
                  child: new Container(
                    child: loginForm,
                    height: double.infinity,
                    width: 350.0,
                  ),
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
  void onLoginError(String errorTxt) {
    // TODO: implement onLoginError

  }

  @override
  void onLoginSuccess(Login login) {
    // TODO: implement onLoginSuccess
  }

}