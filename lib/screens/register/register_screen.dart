import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/model/register.dart';
import 'package:neostore/screens/register/register_screen_presenter.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RegisterState();
  }
}

class RegisterState extends State<RegisterScreen> implements RegisterScreenContract{

  BuildContext ctx;
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  String gender;
  String phoneNo;
  bool isLoading = false;

  RegisterScreenPresenter registerScreenPresenter;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  int _radioValue = 0;
  bool checkbox = false;

  RegisterState() {
    registerScreenPresenter = new RegisterScreenPresenter(this);
  }

  void btnRegister() {
    final form =  formKey.currentState;

    if (form.validate()){
      setState(() {
        isLoading = true;
      });
      form.save();
      registerScreenPresenter.getRegister(firstName, lastName, email, password, confirmPassword, gender, phoneNo);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
        if (_radioValue ==  0) {
          gender = 'M';
        } else {
          gender = 'F';
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ctx = context;

    var registerBtn = new Container(
      margin: const EdgeInsets.only(top: 30.0, bottom: 22.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(onPressed: btnRegister,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
              side: BorderSide(color: Colors.white)),
          color: Colors.white,
          textColor: Color(0xffe91c1a),
          disabledColor: Colors.white,
          padding: new EdgeInsets.all(8.0),
          child: new Text("REGISTER",
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

    var registerForm = SingleChildScrollView(child:
    new Column(
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(top:30.0,bottom: 40.0),
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
                    decoration: InputDecoration(labelText: "First Name",
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
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)), gapPadding: 4.0,
                      ),
                        prefixIcon: Icon(
                          Icons.face,
                          color: Color(0xffffffff),
                          size: 16.0,
                        )
                    ),
                    onSaved: (val) => firstName = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter first name.';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(
                    decoration: InputDecoration(labelText: "Last Name",
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
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)), gapPadding: 4.0,
                      ),
                      prefixIcon: Icon(
                        Icons.face,
                        color: Color(0xffffffff),
                        size: 16.0,
                      )
                    ),
                    onSaved: (val) => lastName = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter last name.';
                      }
                      return null;
                    },
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(
                    decoration: InputDecoration(labelText: "Email",
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
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)), gapPadding: 4.0,
                      ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xffffffff),
                          size: 16.0,
                        )
                    ),
                    onSaved: (val) => email = val,
                    validator: (val) {
                      return !val.contains('@') ? 'Not a valid email.' : null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(
                    decoration: InputDecoration(labelText: "Password",
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
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)), gapPadding: 4.0,
                      ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xffffffff),
                          size: 16.0,
                        )
                    ),
                    onSaved: (val) => password = val,
                    validator: (val) {
                      return val.length < 8
                          ? "Paswword must have atleast 8 chars" : null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(
                    decoration: InputDecoration(labelText: "Confirm Paswword",
                      contentPadding: EdgeInsets.all(15.0),
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
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)), gapPadding: 4.0,
                      ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xffffffff),
                          size: 16.0,
                        )
                    ),
                    onSaved: (val) => confirmPassword = val,
                    validator: (val) {
                      return val.length < 8
                          ? "Confirm Paswword must have atleast 8 chars" : null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),

                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new Row(
                  children: <Widget>[
                    new Text("Gender",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    ),
                     new Radio(
                       activeColor: Colors.white,
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Male',
                      style: new TextStyle(fontSize: 16.0,color: Colors.white),
                    ),
                    new Radio(
                      activeColor: Colors.white,
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 16.0,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
                ),
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(
                    decoration: InputDecoration(labelText: "Phone Number",
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
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)), gapPadding: 4.0,
                      ),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Color(0xffffffff),
                          size: 16.0,
                        )
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (val) => phoneNo = val,
                    validator: (val) {
                      return val.length == 11
                          ? "Phone number must be 10 digit" : null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   new Checkbox(
                    activeColor: Colors.grey,
                      value: checkbox,
                      onChanged: (bool value) {
                        setState(() {
                          checkbox = value;
                        });
                      },
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'I agree the ',
                        style: TextStyle(fontSize: 13,color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                          // can add more TextSpans here...
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
        isLoading ? new CircularProgressIndicator() : registerBtn,

      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    );


    return new Scaffold(
      appBar: new AppBar(title: new Text("Register"),),
      key: scaffoldKey,
      body:
      new Container(
        decoration: new BoxDecoration(
            color: Color(0xffe91c1a),
        ),
        child: new Center(
          child: new ClipRect(
            child: new Container(
              child: registerForm,
              height: double.infinity,
              width: 350.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onRegisterError(String errorTxt) {
    // TODO: implement onRegisterError
    _showSnackBar(errorTxt);
    setState(() => isLoading = false);
//    Navigator.of(context).pop();
  }

  @override
  void onRegisterSuccess(RegisterResponse register)  {
    // TODO: implement onRegisterSuccess
    if (register.userMsg != null) {
      _showSnackBar(register.userMsg);
    }
    setState(() => isLoading = false);
    Navigator.of(context).pop();
  }
}